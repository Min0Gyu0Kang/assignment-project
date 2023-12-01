from fastapi import Depends, FastAPI, Response
from fastapi.security import OAuth2PasswordRequestForm

from fastapi.responses import FileResponse

from fastapi_login import LoginManager
from fastapi_login.exceptions import InvalidCredentialsException

SECRET = "secret"
manager = LoginManager(SECRET, "/login", use_cookie=True)
db = {"a": {"name": "a", "password": "1"}}

app = FastAPI()


@app.post("/token")
def login(response: Response, data: OAuth2PasswordRequestForm = Depends()):
    username = data.username
    password = data.password

    user= get_user(username)
    if username not in db:
        raise InvalidCredentialsException
    if db[username]["password"] != password:
        raise InvalidCredentialsException
    access_token = manager.create_access_token(data={"sub": username})
    manager.set_cookie(response, access_token)
    return {"access_token": access_token}


@app.get("/")
def get_root():
    return "hello"


@app.get("/login")
def get_login():
    return FileResponse("login.html")

