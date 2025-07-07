# Django Weather App 🌤️

A simple Django-based weather application that fetches weather data from OpenWeatherMap API and displays it in a clean, responsive interface.

## 🚀 Quick Start with Docker

### Prerequisites
- Docker installed on your system
- OpenWeatherMap API key (free registration at [openweathermap.org](https://openweathermap.org/api))

### Option 1: Run with Docker (Recommended)

1. **Get your OpenWeatherMap API key:**
   - Go to [OpenWeatherMap](https://openweathermap.org/api)
   - Sign up for a free account
   - Generate an API key

2. **Pull and run the Docker image:**
   ```bash
   docker run -d \
     -p 8000:8000 \
     -e OPENWEATHER_API_KEY=your_api_key_here \
     --name weather-app \
     chethan0907/sde-django-weather-app
   ```

3. **Access the application:**
   - Open your browser and go to `http://localhost:8000`
   - Enter any city name to get weather information

### Option 2: Run with Docker Compose

1. **Create a `docker-compose.yml` file:**
   ```yaml
   version: '3.8'
   services:
     weather-app:
       image: chethan0907/sde-django-weather-app
       ports:
         - "8000:8000"
       environment:
         - OPENWEATHER_API_KEY=your_api_key_here
       restart: unless-stopped
   ```

2. **Run with Docker Compose:**
   ```bash
   docker-compose up -d
   ```

### Option 3: Using Environment File (Most Secure)

1. **Create a `.env` file:**
   ```
   OPENWEATHER_API_KEY=your_api_key_here
   ```

2. **Run with environment file:**
   ```bash
   docker run -d \
     -p 8000:8000 \
     --env-file .env \
     --name weather-app \
     chethan0907/sde-django-weather-app
   ```

## 🛠️ Development Setup

### Local Development

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd weatherdetector
   ```

2. **Create virtual environment:**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

4. **Create `.env` file:**
   ```
   OPENWEATHER_API_KEY=your_api_key_here
   ```

5. **Run the application:**
   ```bash
   python manage.py runserver
   ```

### Building Docker Image Locally

```bash
# Build the image
docker build -t weather-app .

# Run the image
docker run -d -p 8000:8000 -e OPENWEATHER_API_KEY=your_api_key_here weather-app
```

## 📋 Features

- **Real-time Weather Data**: Get current weather information for any city
- **Clean UI**: Simple and responsive design
- **Error Handling**: Proper error messages for invalid cities or API issues
- **Dockerized**: Easy deployment with Docker
- **Environment Variables**: Secure API key configuration

## 🔧 Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `OPENWEATHER_API_KEY` | Your OpenWeatherMap API key | Yes |

### API Information

The app displays:
- **Country**: Country code
- **Coordinates**: Longitude and Latitude
- **Temperature**: Current temperature in Celsius
- **Pressure**: Atmospheric pressure in hPa
- **Humidity**: Humidity percentage

## 🚨 Troubleshooting

### Common Issues

1. **"City not found" error:**
   - Check spelling of the city name
   - Try using city name with country code (e.g., "London,UK")

2. **API errors:**
   - Verify your API key is correct
   - Check if your API key is active (may take a few minutes after registration)
   - Ensure you haven't exceeded the API rate limits

3. **Container not starting:**
   - Check if port 8000 is available
   - Verify the API key is properly set

### Docker Commands

```bash
# Check running containers
docker ps

# View logs
docker logs weather-app

# Stop the container
docker stop weather-app

# Remove the container
docker rm weather-app

# Remove the image
docker rmi chethan0907/sde-django-weather-app
```

## 🔒 Security Notes

- Never commit your API key to version control
- Use environment variables or `.env` files for sensitive data
- The `.env` file is already in `.gitignore` to prevent accidental commits

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 👨‍💻 Author

**Chethan**
- Docker Hub: [chethan0907](https://hub.docker.com/u/chethan0907)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

---

**Happy Weather Checking! 🌤️**
