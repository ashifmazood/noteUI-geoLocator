import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';   
import 'package:geolocator/geolocator.dart';
import 'package:note_ui/geo_location/cgeo_class.dart'; 
 
class Locationprovider with ChangeNotifier {
  Position? _currentpostion; 
  get currentpostion => _currentpostion;
  final LocationService _locationService = LocationService();
  Placemark? _getlocation = Placemark();
  get getlocation => _getlocation;
  Future<Position?> determineposition() async {   
    bool serviceenabled;
    LocationPermission permission;
    serviceenabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceenabled) {   
      _currentpostion = null;  
      notifyListeners();
      return null;
    }
    permission = await Geolocator.checkPermission();   
    if (permission == LocationPermission.denied) {     
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {   
        _currentpostion = null;
        notifyListeners();
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) { 
      _currentpostion = null;
      notifyListeners();
      return null;
    }
    _currentpostion = await Geolocator.getCurrentPosition(); 
    notifyListeners();

    print(_currentpostion);
    _getlocation = await _locationService.getlocationname(_currentpostion); 
    print(_getlocation);
    return null;
  }
}
