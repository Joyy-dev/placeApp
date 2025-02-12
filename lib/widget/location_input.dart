import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;

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
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor
              ),
              onPressed: () {}, 
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location')
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor
              ),
              onPressed: () {}, 
              icon: const Icon(Icons.map),
              label: const Text('Select on map')
            )
          ],
        )
      ],
    );
  }
}