from sqlalchemy.orm import Session
from database import SessionLocal

from models import User, Todo
from schema import TodoSchema
def db_register_user(db:Session,name,password):
    db_item=User(name=name,password=password)
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    return db_item
def db_get_todos(db: Session, user : User):
    return db.query(Todo).filter(Todo.owner_id==user.id).all()
def get_db():
    db = SessionLocal()  # Replace SessionLocal with your actual function to get a database session
    try:
        yield db
    finally:
        db.close()
def db_add_todos(db: Session, user: User, todo: TodoSchema):
    db_item = Todo(content = todo.content,
                   due= todo.due,
                   owner_id=user.id,
                   owner=user)
    db.add(db_item)
    db.commit()
    db.refresh(db_item)
    return db_item
def db_del_todo(db: Session, user: User, todo: TodoSchema):
    db.query(Todo) \
            .filter(Todo.owner_id == user.id) \
            .filter(Todo.id == todo.id) \
            .delete()
    db.commit()
    return True
