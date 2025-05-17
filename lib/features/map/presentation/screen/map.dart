import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:r2ait_app/features/map/logic/get_Current_location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final LocationController _locationController = Get.find<LocationController>();
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    _locationController.myLocation(); // শুরুতেই লোকেশন আনো
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LocationController>(
        builder: (location) {
          if (location.currentLocation == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: location.currentLocation!,
              zoom: 15,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            compassEnabled: true,
            markers: {
              Marker(
                markerId: const MarkerId('initialMarker'),
                position: location.currentLocation!,
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
        },
      ),
    );
  }
}
