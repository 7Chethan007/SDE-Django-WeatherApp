#!/bin/bash

# Django Weather App Installation Script
# This script helps users quickly set up the weather app with their API key

echo "🌤️  Django Weather App Installation"
echo "=================================="
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

echo "✅ Docker is installed"

# Get API key from user
read -p "🔑 Enter your OpenWeatherMap API key: " API_KEY

if [ -z "$API_KEY" ]; then
    echo "❌ API key is required. Get one from: https://openweathermap.org/api"
    exit 1
fi

echo "🚀 Starting Django Weather App..."

# Pull and run the Docker container
docker run -d \
    -p 8000:8000 \
    -e OPENWEATHER_API_KEY="$API_KEY" \
    --name django-weather-app \
    --restart unless-stopped \
    chethan0907/sde-django-weather-app

if [ $? -eq 0 ]; then
    echo "✅ Weather app is running successfully!"
    echo "🌐 Open your browser and go to: http://localhost:8000"
    echo ""
    echo "📋 Useful commands:"
    echo "   View logs: docker logs django-weather-app"
    echo "   Stop app:  docker stop django-weather-app"
    echo "   Remove:    docker rm django-weather-app"
else
    echo "❌ Failed to start the weather app"
    echo "Check if port 8000 is available or if container name already exists"
fi
