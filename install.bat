@echo off
REM Django Weather App Installation Script for Windows
REM This script helps users quickly set up the weather app with their API key

echo 🌤️  Django Weather App Installation
echo ==================================
echo.

REM Check if Docker is installed
docker --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Docker is not installed. Please install Docker first.
    echo Visit: https://docs.docker.com/get-docker/
    pause
    exit /b 1
)

echo ✅ Docker is installed

REM Get API key from user
set /p API_KEY="🔑 Enter your OpenWeatherMap API key: "

if "%API_KEY%"=="" (
    echo ❌ API key is required. Get one from: https://openweathermap.org/api
    pause
    exit /b 1
)

echo 🚀 Starting Django Weather App...

REM Pull and run the Docker container
docker run -d -p 8000:8000 -e OPENWEATHER_API_KEY=%API_KEY% --name django-weather-app --restart unless-stopped chethan0907/sde-django-weather-app

if %errorlevel% equ 0 (
    echo ✅ Weather app is running successfully!
    echo 🌐 Open your browser and go to: http://localhost:8000
    echo.
    echo 📋 Useful commands:
    echo    View logs: docker logs django-weather-app
    echo    Stop app:  docker stop django-weather-app
    echo    Remove:    docker rm django-weather-app
) else (
    echo ❌ Failed to start the weather app
    echo Check if port 8000 is available or if container name already exists
)

pause
