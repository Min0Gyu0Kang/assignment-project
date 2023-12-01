from fastapi import Depends, FastAPI, Response, responses
from requests import Session
from fastapi_login import LoginManager
from models import Base, User, Todo
from crud import db_register_user
from database import SessionLocal, engine

Base.metadata.create_all(bind=engine)
app= FastAPI()
@manager.user_loader
def get_user(username: str, db: Session = None):
    if not db:
        with SessionLocal() as db:
            return db.query(User).filter(User.name==username).first()
    return db.query(User).filter(User.name==username).first()