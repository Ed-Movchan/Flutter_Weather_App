import 'package:bloc/bloc.dart';
import 'package:flutter_weather_app/events/weather_events.dart';
import 'package:flutter_weather_app/models/weather.dart';
import 'package:flutter_weather_app/services/weather_service.dart';
import 'package:flutter_weather_app/states/weather_states.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String cityName;
  WeatherBloc(this.cityName) : super(null) {
    add(WeatherRequested(city: cityName));
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather =
            await WeatherService.fetchCurrentWeather(query: event.city);
        final List<Weather> hourlyWeather =
            await WeatherService.fetchHourlyWeather(query: event.city);
        yield WeatherLoadSuccess(
            weather: weather, hourlyWeather: hourlyWeather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
