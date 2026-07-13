# Указываем базовый образ
FROM python:3.14-slim

# Устанавливаем рабочую директорию в контейнере
WORKDIR /myapp

# Копируем файл с зависимостями и устанавливаем их

RUN apt-get update \
    && apt-get install -y gcc libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/list/*

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта в контейнер
COPY . .

ENV SECRET_KEY="django-insecure-8n*6znv@vhf@0ey1zg5cxryw&@9f(95=!$1uu61jub2qjynb=o"
ENV CELERY_BROKER_URL="redis://redis:6379/0"
ENV CELERY_BACKEND="redis://redis:6379/0"

RUN mkdir -p /myapp/media/
# Открываем порт 8000 для взаимодействия с приложением
EXPOSE 8000

# Определяем команду для запуска приложения
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]