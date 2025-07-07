from django.shortcuts import render
import json, urllib.request, urllib.error, os
from dotenv import load_dotenv
from pathlib import Path

load_dotenv(dotenv_path=Path(__file__).resolve().parent.parent / '.env')

def index(request):
    data = {}
    city = ''
    error_message = ''

    if request.method == 'POST':
        city = request.POST.get('city')
        api_key = os.environ.get('OPENWEATHER_API_KEY')

        if city:
            url = f'http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric'
            try:
                req = urllib.request.Request(url, headers={'User-Agent': 'Mozilla/5.0'})
                res = urllib.request.urlopen(req).read()
                json_data = json.loads(res)
                data = {
                    'country': str(json_data['sys']['country']),
                    'coordinate': f"{json_data['coord']['lon']} {json_data['coord']['lat']}",
                    'temp': str(json_data['main']['temp']),
                    'pressure': str(json_data['main']['pressure']),
                    'humidity': str(json_data['main']['humidity']),
                }
            except urllib.error.HTTPError as e:
                error_message = "City not found or API error."
            except Exception as e:
                error_message = f"An error occurred: {str(e)}"
        else:
            error_message = "City name cannot be empty."

    return render(request, 'index.html', {
        'city': city,
        'data': data,
        'error': error_message
    })
