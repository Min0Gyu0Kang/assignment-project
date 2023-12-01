from fastapi import FastAPI, Depends
from fastapi.responses import FileResponse
from sqlalchemy.orm import Session

from typing import List

from schema import MusicRequest, MusicRequestCreate
from crud import get_playlist, add_playlist
from models import Base, Playlist
from database import SessionLocal, engine

Base.metadata.create_all(bind=engine)
app=FastAPI()
def get_db():
    db=SessionLocal()
    try:
        yield db
    finally:
        db.close()
@app.get("/")
def get_index(): 
    return FileResponse("index.html")

@app.get("/getplaylist", response_model=List [MusicRequest]) 
def get_data(db: Session = Depends(get_db)):
    return get_playlist(db)

@app.post("/postmusic", response_model=List[MusicRequest])
def post_music(music_req: MusicRequestCreate, db: Session = Depends(get_db)): 
    return add_playlist(db, music_req)