import 'package:location/location.dart';

class LocationInfo {
  double longitude;
  double latitude;

  Future<void> getUserLocationData() async {
    Location location = new Location();
    // ignore: unrelated_type_equality_checks
    if (await Location().hasPermission() == false) {
      // ignore: unrelated_type_equality_checks
      if (await Location().requestPermission() == false) {
        return;
      }
    }
    location.changeSettings(accuracy: LocationAccuracy.HIGH);
    try {
      var currentLocation = await location.getLocation();
      longitude = currentLocation.longitude;
      latitude = currentLocation.latitude;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getUserLocationAndGPS() async {
    if(await Location().requestService())
    {
      // ignore: unrelated_type_equality_checks
      if(await Location().requestPermission() == true)
        return true;
    }
    return false;
  }
}
