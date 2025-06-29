# Deploying-Frontend-apps-
# Deploying Frontend Apps: React + Nginx + CI/CD 🚀

## 📦 Технологический стек

### Frontend
- **React** + **Vite** + **TypeScript**

### Backend
- **FastAPI** (в разработке)

### База данных
- **PostgreSQL** (в разработке)

### DevOps
- **Docker**, **Docker Compose**
- **GitHub Actions** (CI/CD)
- **Nginx** (сейчас не используется)

### Хостинг
- **Yandex Cloud** 
- Домен: **allower.ru**
- **Network Load Balancer** → (в разработке переход на L7)

---

## 🛠️ Этапы развертывания

### 1. Настройка серверов
- Сервера на **Ubuntu**
  ![Сервера](https://github.com/user-attachments/assets/08daa6b9-d3fe-4688-9cb6-5978529c95b1)

### 2. Установка необходимого ПО
bash
`apt install nginx docker`

3.  Nginx только для проверок!
`systemctl start nginx , в базе systemctl stop nginx and systemctl disable nginx`
4. Работа с VPC
Создана VPC → allower-net

Создана подсеть → allower-pod-net
<img width="1123" alt="VPC" src="https://github.com/user-attachments/assets/7b5e2e60-40b3-4fd4-bb0d-300c95dc755e">

5. Объединение узлов
Все узлы включены в одну подсеть allower-pod-net

6. Создание целевой группы
https://github.com/user-attachments/assets/b5736c37-ee74-4067-913c-683c92184fa9

7. Настройка Load Balancer
Создан Network Load Balancer в своей сети
<img width="1080" alt="Load Balancer" src="https://github.com/user-attachments/assets/9a5e7532-0f47-40ad-a75a-c8e6344e89d1">

8. Локальная проверка
Проверка работоспособности через Nginx ✅

9. Покупка и настройка домена
Приобретен домен allower.ru

Настроены DNS-серверы Yandex

10. Настройка DNS-записи
Создана зона в Yandex Cloud

Добавлена запись типа A с IPv4 Load Balancer

11. Результат
![455732448-641db5c1-fc53-4974-b549-1b8d59775cb1](https://github.com/user-attachments/assets/7c75b126-0060-4805-80a7-3f3b2b20eb84)

### 12. Создадим сертификат SSL от LETS_ENCRYPT в самом яндексе
- так по интрукции добавить запись в dns

### 13. создаем L7 балансер через визард
    
 ### создадим либо до либо уже при самой настройки целевые узлы (
  ![telegram-cloud-photo-size-2-5382270299304751738-y](https://github.com/user-attachments/assets/884ca70a-83f3-4f90-ae73-f97f0acc9b3f)
### 14. группа бэкэндов ( можно создать также до )
![telegram-cloud-photo-size-2-5382270299304751735-y](https://github.com/user-attachments/assets/d28672d3-a741-46c2-b82a-51ceb4f098b7)
### 15. создадим роутер
  ![telegram-cloud-photo-size-2-5382270299304751732-y](https://github.com/user-attachments/assets/d2a1eb62-23c0-4936-b773-ba60283a171e)
### 16. создадим обработчик
  ![telegram-cloud-photo-size-2-5382270299304751728-y](https://github.com/user-attachments/assets/7e0d5035-dc40-41b1-8f6d-7ce8c3b1eb91)

### 17. Итог 
 ![2025-06-29 00 12 49](https://github.com/user-attachments/assets/ac26c33b-b755-40b0-9efb-796b264deaa8)

### окончательно перешел на docker-compose, в следствие появилась система мониторинга Prometheus + Grafana
 - тут настройка ( просто скачал утилиту Prometheus и добавил в Dashdboards )
![telegram-cloud-photo-size-2-5406967052746488988-y](https://github.com/user-attachments/assets/ba9f6dc2-c88b-4dc4-afce-6c0f5522a8db)

### вот фрагмент 
![telegram-cloud-photo-size-2-5406967052746488993-y](https://github.com/user-attachments/assets/3efe90e3-4077-41e0-945c-44ecb322e55d)
### Итоговый итог )
![image](https://github.com/user-attachments/assets/8b1ceef8-dacc-471f-85b1-96154f87cea3)


🔜 Планы по развитию
В разработке:
Добавление SSL-сертификата при переходе на L7 Load Balancer ✅

Миграция на docker-compose ✅

Интеграция Grafana и Prometheus для мониторинга ✅

- бд - 
- backend -
- добавить  FastCGI к nginx

  -------
  Что бы просто поднять на сервере ---> поставить docker, запулить код, docker-compose up -d
