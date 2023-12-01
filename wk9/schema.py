from pydantic import BaseModel
from typing import Optional

class MusicRequestBase(BaseModel):
    artist: str
    music: str
class MusicRequestCreate(MusicRequestBase):
    pass 
class MusicRequest(MusicRequestBase):
    index: Optional[int]

    class Config:
        orm_mode=True