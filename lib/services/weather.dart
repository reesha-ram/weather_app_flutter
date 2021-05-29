import 'package:flutter/cupertino.dart';
import 'package:weather_app1/services/networking.dart';

class Weather {
  final _apiKey = '&units=metric&appid=3c1a380050706ed1f86437ba77e98bbd';
  final _apiURL = 'https://api.openweathermap.org/data/2.5/';

  Future getLocationWeatherCurrentData(
      {@required double longitude, @required double latitude}) async {
    NetworkHelper networkHelper = new NetworkHelper(
        url: '${_apiURL}weather?lat=$latitude&lon=$longitude$_apiKey');
    return await networkHelper.getResponseData();
  }

  Future getCityWeatherCurrentData({@required String cityName}) async {
    NetworkHelper networkHelper =
        new NetworkHelper(url: '${_apiURL}weather?q=$cityName$_apiKey');
    return await networkHelper.getResponseData();
  }

  Future getCityWeatherForecastData({@required String cityName}) async {
    NetworkHelper networkHelper =
        new NetworkHelper(url: '${_apiURL}forecast?q=$cityName$_apiKey');
    return await networkHelper.getResponseData();
  }
}
