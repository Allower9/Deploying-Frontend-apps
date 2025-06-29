from fastapi import FastAPI
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

DATABASE_URL = "postgresql://user:password@db:5432/mydb"
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, bind=engine)
Base = declarative_base()

# Модель для БД
class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String)

# Создаём таблицы (в реальном проекте используйте миграции, например, Alembic)
Base.metadata.create_all(bind=engine)

app = FastAPI()

# Роут для примера
@app.get("/")
def read_root():
    return {"Hello": "World"}

# Роут для работы с БД
@app.get("/users/")
def get_users():
    db = SessionLocal()
    users = db.query(User).all()
    db.close()
    return {"users": [user.name for user in users]}
