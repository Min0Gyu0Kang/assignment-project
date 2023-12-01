from logging import Manager
from fastapi import Depends, FastAPI
from requests import Session
from fastapi_login import LoginManager
from crud import db_del_todo, db_get_todos, get_db
from schema import TodoSchemaAdd, TodoSchemaDelete

app=FastAPI()

@app.delete("/todo", response_model=List[TodoSchemaAdd])
def del_todo(todo: TodoSchemaDelete, 
             db: Session = Depends(get_db),
             user=Depends(Manager)):
    result = db_del_todo(db, user, todo)
    print(db_get_todos(db,user))
    return db_get_todos(db,user)