import 'package:simple_weather/data/remote_data_sources/weather_remote_data_source.dart';
import 'package:simple_weather/domain/models/weather_model.dart';

class WeatherRepository {
  WeatherRepository(this._weatherRemoteDataSource);

  final WeatherRemoteDataSource _weatherRemoteDataSource;

  Future<WeatherModel?> getWeatherModel({
    required String city,
  }) async {
    final responseData =
        await _weatherRemoteDataSource.getWeatherData(city: city);

    if (responseData == null) {
      return null;
    }
    final String name = responseData['location']['name'];
    final double temperature = responseData['current']['temp_c'] + 0.0;
    return WeatherModel(city: name, temperature: temperature);
  }
}
