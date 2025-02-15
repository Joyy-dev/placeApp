import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:placeapp/helpers/location_helper.dart';
import 'package:placeapp/screens/map_screen.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

  Future<void> _getUserCurrentLocation() async{
    final locData = await Location().getLocation();
    final staticMapImageUrl = LocationHelper.getDirectionsUrl(
     locData.longitude!, 
     locData.latitude!
    );
    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

    Future<void> _onSelectMap() async{
    final selectedLocation = await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MapScreen()));
    if (selectedLocation == null) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          child: _previewImageUrl == null 
          ? const Text('No Location Chosen') 
          : Image.network(_previewImageUrl!, fit: BoxFit.cover,),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor
              ),
              onPressed: _onSelectMap, 
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location')
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor
              ),
              onPressed: _getUserCurrentLocation, 
              icon: const Icon(Icons.map),
              label: const Text('Select on map')
            )
          ],
        )
      ],
    );
  }
}