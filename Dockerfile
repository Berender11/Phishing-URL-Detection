# Dockerfile — use this exactly
FROM python:3.9.13-slim

WORKDIR /app

# copy only requirements first for better cache
COPY requirements.txt requirements.txt

RUN python -m pip install --upgrade pip setuptools wheel \
 && pip install --no-cache-dir -r requirements.txt

# copy the rest of the app
COPY . .

# tell Docker / Render which port the app will listen on
EXPOSE 10000

# run using gunicorn and bind to 0.0.0.0:10000 (2 workers)
# this is a shell form so $PORT or env var would work, but use fixed port 10000 to match EXPOSE
CMD ["gunicorn", "app:app", "--bind", "0.0.0.0:10000", "--workers", "2", "--threads", "2"]
