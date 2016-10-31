from app.models import WorkItems, WorkSchedule
from app.work_agenda_db_connection import work_agenda_db_session
from wage_calculation import wage_calculation_between_date_intervals
from datetime import datetime

work_items = work_agenda_db_session.query(WorkItems).all()
work_schedule = work_agenda_db_session.query(WorkSchedule).all()

weekly_working_schedule_and_rates = work_agenda_db_session\
    .query(WorkItems.work_item_id, WorkItems.description,
           WorkItems.charge_in_euros, WorkSchedule.weekday,
           WorkSchedule.duration_in_hours)\
    .filter(WorkItems.is_current)\
    .join(WorkSchedule, WorkSchedule.work_item_id == WorkItems.work_item_id).all()

start_date = datetime.strptime(str(input("Input start date:  ")), '%b %d %Y')  # Jun 1 2016
end_date = datetime.strptime(str(input("Input end date:  ")), '%b %d %Y')

wage = wage_calculation_between_date_intervals.wage_calculation_between_date_intervals(start_date, end_date, weekly_working_schedule_and_rates)

print('Done! The wage for the selected period is {} euros.'.format(wage))

