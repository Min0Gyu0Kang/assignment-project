from pydantic import BaseModel
from typing import Optional
from datetime import datetime

class UserSchema(BaseModel):
    id: Optional[int]
    name: str
    password: str
    class Config:
        orm_mode=True
class TodoSchemaAdd(BaseModel):
    content: Optional[str]
    due: Optional[datetime]
class TodoSchemaDelete(BaseModel):
    content: Optional[str]
    due: Optional[datetime]
    id: Optional[int]
    owner_id: Optional[int]
    owner: Optional[UserSchema]
    class Config:
        orm_mode=True