import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:r2ait_app/features/map/logic/get_Current_location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});
  @override
  State<MapPage> createState() => _amState();
}

const LatLng initialPosition = LatLng(23.763912194094274, 90.42875411066503);
late GoogleMapController mapController; // San Francisco
LocationController _locationController = Get.find<LocationController>();

class _amState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder(
          init: _locationController,
          builder: (location) {
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: location.currentLocation ?? initialPosition,
                zoom: 15,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              markers: {
                Marker(
                  markerId: const MarkerId('initialMarker'),
                  position: location.currentLocation ?? initialPosition,
                  infoWindow: const InfoWindow(
                    title: 'My Location',
                    snippet: 'Dhaka, Bangladesh',
                  ),
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            );
          }),
    );
  }

  // final Set<Marker> _markers = {
  //   Marker(
  //     markerId: MarkerId('initialMarker'),
  //     position: LatLng(23.76377498885718, 90.42878122313259),
  //     infoWindow: InfoWindow(
  //       title: 'My Location',
  //       snippet: 'Dhaka, Bangladesh',
  //     ),
  //   ),
  // };
}
