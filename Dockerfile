# Use Python 3.9 base image
FROM python:3.9.13-slim

# Set working directory
WORKDIR /app

# Copy dependency files
COPY requirements.txt requirements.txt

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the app
COPY . .

# Expose port 10000 for Render
EXPOSE 10000

# Start Flask app
CMD ["python", "app.py"]
