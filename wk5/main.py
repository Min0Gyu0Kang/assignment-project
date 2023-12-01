from typing import Union

from fastapi import FastAPI, Request, Form
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse,RedirectResponse
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

app = FastAPI()

app.mount("/static", StaticFiles(directory="static",html=True),name="static")
templates=Jinja2Templates(directory="templates")          

@app.get("/hello")
def read_hello():
    return{"Hello": "World"}
playlist = \
{"Donna Summer": "I feel love",
 "Cocteau Twins": "Pitch the Baby",
 "SOPHIE":"VYZEE",
 "Black Midi": "John L"}

@app.get("/")
def read_root(req: Request):
    return templates.TemplateResponse("content.html",
    {"request": req,
    "name": "Nil Landgren",
    "playlist": playlist})

@app.post("/addmusic")
def get_addmusic(artist: str= Form(), music:str= Form()):
    playlist[artist]= music
    return RedirectResponse("/", status_code=302)