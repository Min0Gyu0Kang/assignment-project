from fastapi import FastAPI, WebSocket, Depends, HTTPException
from fastapi.responses import HTMLResponse,FileResponse
from fastapi.staticfiles import StaticFiles
from starlette.middleware.cors import CORSMiddleware
from sqlalchemy import create_engine, Column, Integer, String, DateTime, text
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker, Session
from fastapi import WebSocket, WebSocketDisconnect

DATABASE_URL = "sqlite:///./test.db"
engine = create_engine(DATABASE_URL)
Base = declarative_base()

# Define ChatMessage model
class ChatMessage(Base):
    __tablename__ = "chat_messages"
    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(String, index=True)
    content = Column(String)
    timestamp = Column(DateTime, server_default=text("CURRENT_TIMESTAMP"))

# Create tables in the database
Base.metadata.create_all(bind=engine)

# Dependency to get the database session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Initialize FastAPI app
app = FastAPI()

# Enable CORS for all routes
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this to your needs
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Mount the static files directory
app.mount("/static", StaticFiles(directory="static"), name="static")
# Add a route to serve the index.html
@app.get("/", response_class=HTMLResponse)
async def read_root():
    return FileResponse("static/index.html")

# Add a route to serve the function.js
@app.get("/function.js")
async def read_js():
    return FileResponse("static/function.js")
# WebSocket route for handling connections
@app.websocket("/ws/{user_id}")
async def websocket_endpoint(websocket: WebSocket, user_id: str, db: Session = Depends(get_db)):
    await websocket.accept()

    # Send chat history to the connected user
    chat_history = db.query(ChatMessage).filter(ChatMessage.user_id == user_id).all()
    for message in chat_history:
        await websocket.send_text(f"Message from {message.user_id}: {message.content}")

    try:
        while True:
            data = await websocket.receive_text()

            # Save the message to the database
            db_message = ChatMessage(user_id=user_id, content=data)
            db.add(db_message)
            db.commit()

            # Broadcast the message to all connected users
            await broadcast_message(f"Message from {user_id}: {data}")

    except WebSocketDisconnect:
        # Remove user from connected users
        await broadcast_message(f"User {user_id} disconnected.")