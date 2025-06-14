# Stage 1: Сборка приложения
FROM node:18-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Запуск через Nginx
FROM nginx:alpine

# Создаем директорию и задаем права
RUN mkdir -p /var/www/dist && \
    chown -R nginx:nginx /var/www && \
    chmod -R 755 /var/www

# Копируем собранное приложение
COPY --from=builder /app/dist /var/www/dist

# Копируем конфиг Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
