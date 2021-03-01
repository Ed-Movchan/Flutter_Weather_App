import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;

  const WeatherCard(
      {Key key,
      this.title,
      this.temperature,
      this.iconCode,
      this.temperatureFontSize = 32,
      this.iconScale = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.title,
                style: TextStyle(color: Colors.white),
              ),
              Image.network(
                  "http://openweathermap.org/img/wn/${this.iconCode}@2x.png",
                  scale: this.iconScale),
              Text(
                '${this.temperature}°',
                style: TextStyle(
                    fontSize: this.temperatureFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
