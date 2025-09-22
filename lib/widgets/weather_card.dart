import 'package:flutter/material.dart';
import 'package:wheather_app/models/weather_model.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;
  const WeatherCard({super.key, required this.weather});

  String formatTime(int timeStamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
    return DateFormat('hh:mm a').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color.fromARGB(156, 255, 255, 255),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Lottie.asset(
                weather.description.contains('rain')
                    ? 'assets/rain.json'
                    : weather.description.contains('clear')
                    ? 'assets/sunny.json'
                    : 'assets/cloudy.json',

                height: 150,
                width: 150,
              ),
              Text(
                weather.cityName,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: 10),

              Text(
                '${weather.temperature.toStringAsFixed(1)}°C',
                style: Theme.of(
                  context,
                ).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Humidity: ${weather.humidity}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  SizedBox(width: 10),
                  Text(
                    'Wind: ${weather.windSpeed} m/s',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.wb_sunny_outlined, color: Colors.orange),
                      Text(
                        'Sunrise',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        formatTime(weather.sunrise),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.nights_stay_outlined, color: Colors.purple),
                      Text(
                        'Sunset',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        formatTime(weather.sunset),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
