# backend/Dockerfile
# Этап 1: сборка зависимостей
FROM python:3.12 AS builder
WORKDIR /app
COPY backend/requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# Этап 2: финальный образ
FROM python:3.12-slim
WORKDIR /app

# Копируем зависимости из builder
COPY --from=builder /root/.local /root/.local
COPY backend/app.py .

# Запускаем сервер
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
