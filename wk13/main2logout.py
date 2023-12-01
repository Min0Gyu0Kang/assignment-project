from fastapi import Depends, FastAPI, Request, Response
from fastapi.security import OAuth2PasswordRequestForm
from fastapi.responses import FileResponse, RedirectResponse

from fastapi_login import LoginManager
from fastapi_login.exceptions import InvalidCredentialsException

class NotAuthenticatedException(Exception):
    pass
app= FastAPI()
SECRET="super-secret-key"
db = {"a": {"name": "a", "password": "1"}}

manager = LoginManager(SECRET,'/login',use_cookie=True,
                       custom_exception=NotAuthenticatedException)
@app.exception_handler(NotAuthenticatedException)
def auth_exception_handler(request: Request, exc: NotAuthenticatedException):
    """
Redirect the user to the login page if not logged in
    """
    return RedirectResponse(url='/login')
@manager.user_loader
def get_user(username: str):
    return db.get(username)

@app.get("/")
def get_root(user=Depends(manager)):
    return FileResponse("index1.html")
@app.get("/login")
def get_login():
    return FileResponse("login.html")
@app.get("/logout")
def logout(response : Response):
    response = RedirectResponse("/login",status_code=302)
    response.delete_cookie(key="access-token")
    return response