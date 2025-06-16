# Deploying-Frontend-apps
#  React + Nginx  + CI/CD


## 📦 Стек технологий

- **Frontend:** React + Vite + TypeScript
- **Backend:** FastAPI (in development)
- **Proxy:** Nginx (currently not in use anymore)
- **Database:** PostgreSQL ( in development )
- **DevOps:** Docker, Docker Compose, GitHub Actions (CI/CD)
- **Hosting:** yandex.ru
- домен allower.ru
- load balancer (Network Load Balancer) --> ( in development  L7 )
---

1) сервера на ubuntu
 ![image](https://github.com/user-attachments/assets/08daa6b9-d3fe-4688-9cb6-5978529c95b1)

2) установленны nginx ( apt install nginx ) и Докер ( apt install docker )
3) enable nginx
4) Работа с VPC ( создана VPC --> allower-net, а в ней используемая подсеть --> allower-pod-net )
  <img width="1123" alt="Снимок экрана 2025-06-17 в 00 30 04" src="https://github.com/user-attachments/assets/7b5e2e60-40b3-4fd4-bb0d-300c95dc755e" />
   
5)После включил свои узлы в одну подсеть allower-pod-net

6)Создал целевую группу из наших узлов
![image](https://github.com/user-attachments/assets/b5736c37-ee74-4067-913c-683c92184fa9)

7) Приступил к созданию load balancer (Network Load Balancer) используя свою сеть
<img width="1080" alt="Снимок экрана 2025-06-17 в 00 33 56" src="https://github.com/user-attachments/assets/9a5e7532-0f47-40ad-a75a-c8e6344e89d1" />
8) локально убедиться с помощью nginx в его работоспособности +
9) Покупка домена и его настройка ( указание dns-серверов яндекс ) 
10) создание на yandex cloud зону и в ней запись типа А с ipv4 load balancer(а)
   Все работает
12) ![image](https://github.com/user-attachments/assets/641db5c1-fc53-4974-b549-1b8d59775cb1)

