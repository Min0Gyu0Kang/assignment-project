
from fastapi import Depends, FastAPI
from requests import Session
from crud import db_add_todos, db_get_todos
from schema import TodoSchemaAdd
from fastapi_login import LoginManager
app= FastAPI()

@app.post("/todo",response_model=List[TodoSchemaAdd])
def add_todo(todo: TodoSchemaAdd,
             db: Session = Depends(get_db),
             user=Depends(manager)):
        result = db_add_todos(db, user, todo)
        if not result:
                return None
        return db_get_todos(db,user)