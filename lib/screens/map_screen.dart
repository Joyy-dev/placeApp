import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:placeapp/models/places.dart';

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;

  const MapScreen({
    this.initialLocation = const PlaceLocation(
      latitude: 37.422, 
      longitude: -122.084
    ), 
    this.isSelecting = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Screen'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.black,
        actions: [
          if (widget.isSelecting)
          IconButton(
            onPressed: _pickedLocation != null ? () {
              Navigator.of(context).pop(_pickedLocation);
            } : null, 
            icon: const Icon(Icons.check)
          )
        ],
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialLocation.latitude, 
            widget.initialLocation.longitude
          ),
          zoom: 16.0
        ),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _pickedLocation == null ? {} : {
          Marker(
            markerId: const MarkerId('m1'), 
            position: _pickedLocation!
          )
        },
      ),
    );
  }
}