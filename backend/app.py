from fastapi import FastAPI

app = FastAPI()

@app.get("/api/lol")
def get_lol_info():
    return {
        "message": "Это информация из /api/lol",
        "data": {
            "example": "Данные могут быть любыми",
            "status": "success"
        }
    }
