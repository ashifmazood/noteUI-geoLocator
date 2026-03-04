import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  Future<Placemark?> getlocationname(Position? position) async {
    try {
      if (position != null) {
        final placemark = await placemarkFromCoordinates(  //placemarkFromCoordinates() comes from the geocoding package,It converts geographic coordinates (latitude & longitude) into a human-readable address — such as country, city, postal code, etc.
          position.latitude,
          position.longitude,
        );
        if (placemark.isNotEmpty) {
          print(placemark);
          return placemark[0];
        }
      }
      return null;
    } catch (e) {
      print(e);
    }
    return null;
  }
}