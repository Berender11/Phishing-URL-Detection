FROM python:3.9.13-slim

WORKDIR /app

COPY requirements.txt requirements.txt

RUN python -m pip install --upgrade pip setuptools wheel \
 && pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose dynamic $PORT assigned by Render
EXPOSE ${PORT}

CMD ["sh", "-c", "gunicorn app:app --bind 0.0.0.0:${PORT} --workers 2 --threads 2"]
