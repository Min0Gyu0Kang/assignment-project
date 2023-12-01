from fastapi import FastAPI, WebSocket, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates

app = FastAPI()
# html 파일을 서비스할 수 있는 Jinja 설정 (/templates 폴더 사용)
templates = Jinja2Templates(directory="templates")
# 웹소켓 연결을 테스트 할 수 있는 웹페이지 (http://127.0.0.1:8000/client)
class ConnectionManager:
    def __init__(self):
        self.active_connections = []

    async def connect(self, websocket: WebSocket):
        await websocket.accept()
        self.active_connections.append(websocket)

    async def disconnect(self, websocket: WebSocket):
        self.active_connections.remove(websocket)

    async def broadcast(self, message: str):
        for connection in self.active_connections:
            await connection.send_text(message)

manager = ConnectionManager()

@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
	await manager.connect(websocket)
	try:
		while True:
			data = await websocket.receive_text()
			await manager.broadcast(f"{data}")
	except Exception as e:
		pass
	finally:
		await manager.disconnect(websocket)

@app.get("/client")
async def client(request: Request):
	# /templates/client.html파일을 response함
	return templates.TemplateResponse("client.html",
{"request":request})
def run():
	import uvicorn
	uvicorn.run(app)
if __name__ == "__main__":
	run()