# === Stage 1: Builder ===
FROM python:3.12 AS builder

WORKDIR /app

# Copy and install dependencies to user directory (to avoid system-level pollution)
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

# === Stage 2: Final Image ===
FROM python:3.12-slim

# Environment setup
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PATH="/root/.local/bin:$PATH"

# Default environment variables (can be overridden at runtime)
ENV OPENWEATHER_API_KEY=""

WORKDIR /app

# Install system dependencies (slim image doesn't include these)
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy installed Python packages from builder
COPY --from=builder /root/.local /root/.local

# Copy project source
COPY . .

# Expose port
EXPOSE 8000

# Start the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
