import os

from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import scoped_session, sessionmaker

WORK_AGENDA_DATABASE_URL = 'postgresql://localhost:5432/postgres'

work_agenda_engine = create_engine(WORK_AGENDA_DATABASE_URL, convert_unicode=True)
work_agenda_db_session = scoped_session(sessionmaker(autocommit=False, autoflush=False, bind=work_agenda_engine))
work_agenda_base = declarative_base()
work_agenda_base.query = work_agenda_db_session.query_property()


def init_db():
    from app import models
    work_agenda_base.metadata.create_all(bind=work_agenda_engine)