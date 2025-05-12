import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  State<MapPage> createState() => _amState();
}

const LatLng initialPosition = LatLng(23.763912194094274, 90.42875411066503);
late GoogleMapController mapController; // San Francisco

class _amState extends State<MapPage> {
  final Set<Marker> _markers = {
    Marker(
      markerId: MarkerId('initialMarker'),
      position: LatLng(23.76377498885718, 90.42878122313259),
      infoWindow: InfoWindow(
        title: 'My Location',
        snippet: 'Dhaka, Bangladesh',
      ),
    ),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: initialPosition,
          zoom: 15,
        ),
        markers: _markers,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
    return Scaffold();
  }
}
