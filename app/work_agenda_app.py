from app.models import WorkItems, WorkSchedule
from app.work_agenda_db_connection import work_agenda_db_session

retrieved_all_work_items_query = work_agenda_db_session.query(WorkItems).all()
retrieved_work_schedule_query = work_agenda_db_session.query(WorkSchedule).all()

print('Done')