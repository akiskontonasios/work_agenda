from sqlalchemy import BigInteger, Boolean, Column, DateTime, Float, Integer, String, Text, func

from app.work_agenda_db_connection import work_agenda_base


class WorkItems(work_agenda_base):
    __tablename__ = 'work_items'

    work_item_id = Column(BigInteger, primary_key=True, autoincrement=False)
    description = Column(String())
    charge_in_euros = Column(Float)
    start_date = Column(DateTime)
    end_date = Column(DateTime)
    is_current = Column(Boolean)

    def __init__(self, work_item_id, description, charge_in_euros, start_date, end_date, is_current):
        self.work_item_id = work_item_id
        self.description = description
        self.charge_in_euros = charge_in_euros
        self.start_date = start_date
        self.end_date = end_date
        self.is_current = is_current


class WorkSchedule(work_agenda_base):
    __tablename__ = 'working_schedule'

    work_item_id = Column(BigInteger, primary_key=True)
    weekday = Column(String(), primary_key=True)
    duration_in_hours = Column(Float, primary_key=True)

    def __init__(self, work_item_id, weekday, duration_in_hours):
        self.work_item_id = work_item_id
        self.weekday = weekday
        self.duration_in_hours = duration_in_hours
