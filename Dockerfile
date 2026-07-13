FROM ghcr.io/astral-sh/uv:0.11.28-python3.14-trixie

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    UV_LINK_MODE=copy

WORKDIR /app

COPY requirements.txt ./
COPY requirements-dev.txt ./

RUN uv pip install --system -r requirements.txt -r requirements-dev.txt

COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]