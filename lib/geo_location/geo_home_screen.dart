import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:note_ui/geo_location/geo_provider.dart';
import 'package:provider/provider.dart';

class LocationHomeScreen extends StatefulWidget {
  const LocationHomeScreen({super.key});

  @override
  State<LocationHomeScreen> createState() => _LocationHomePageState();
}

class _LocationHomePageState extends State<LocationHomeScreen> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    final locationprovider = Provider.of<Locationprovider>(
      context,
      listen: false,
    );
    
    locationprovider.determineposition().then((_) {
      if (locationprovider.currentpostion != null) {
        _addMarker(locationprovider);
      }
    });
  }

  void _addMarker(Locationprovider locationprovider) {
    if (locationprovider.currentpostion != null) {
      final position = locationprovider.currentpostion;
      final marker = Marker(
        markerId: MarkerId('current_location'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: InfoWindow(
          title: 'Your Location',
          snippet: locationprovider.getlocation?.locality ?? 'Unknown',
        ),
      );

      setState(() {
        _markers.add(marker);
      });

      // Animate camera to current location
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 15.0,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Column(
          children: [
            // Location Header
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Consumer<Locationprovider>(
                builder: (context, locationprovider, child) {
                  final locationcity = locationprovider.getlocation?.locality ?? 'Getting location...';
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.location_on, color: Colors.white70),
                      SizedBox(width: 8),
                      Text(
                        locationcity,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            // Google Map
            Expanded(
              child: Consumer<Locationprovider>(
                builder: (context, locationprovider, child) {
                  if (locationprovider.currentpostion == null) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  final position = locationprovider.currentpostion;
                  return GoogleMap(      
                    initialCameraPosition:   
                    CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 15.0, 
                    ),
                    markers: _markers, 
                    myLocationEnabled: true, 
                    myLocationButtonEnabled: true,  
                    zoomControlsEnabled: true,  
                    mapType: MapType.normal,   
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;  
                    },   
                    onTap: (LatLng location) {   
                      // Add marker on tap with default appearance
                      setState(() {
                        _markers.add(    
                          Marker(
                            markerId: MarkerId(location.toString()),
                            position: location,
                            infoWindow: InfoWindow(
                              title: 'New Marker',
                              snippet: '${location.latitude.toStringAsFixed(4)}, ${location.longitude.toStringAsFixed(4)}',
                      

                            ),
                          ),
                        );
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
@override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }
}