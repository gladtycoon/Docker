# 🐳 Docker

## Запуск проекта

### 1. Сборка и запуск

```bash
docker-compose up --build
```

### 2. Применить миграции

```bash
docker-compose exec web python manage.py migrate
```

### 3. Создать суперпользователя

```bash
docker-compose exec web python manage.py createsuperuser
```

---

## Переменные окружения (`.env`)

Создай `.env` в корне проекта:

```env
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_HOST=
DB_PORT=
```

---

## Остановка

```bash
docker-compose down
```

---

## Очистка (удалить всё)

```bash
docker-compose down -v
```

---

## Логи

```bash
docker-compose logs -f
```