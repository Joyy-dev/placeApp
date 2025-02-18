import 'package:flutter/material.dart';
import 'package:placeapp/providers/great_places.dart';
import 'package:placeapp/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlacesDetailsScreen extends StatelessWidget {
  static const routeName = '/places-detail';
  const PlacesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments as String;
    final selectedPlace = Provider.of<GreatPlaces>(context, listen: false).findByID(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),

      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(selectedPlace.image, fit: BoxFit.cover, width: double.infinity,),
          ),
          const SizedBox(height: 10,),
          Text(selectedPlace.location?.address ?? 'No address', textAlign: TextAlign.center,),
          const SizedBox(height: 10,),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) => MapScreen(
                    initialLocation: selectedPlace.location!,
                    isSelecting: false,
                  )
                )
              );
            }, 
            child: const Text('View On Map')
          )
        ],
      ),
    );
  }
}