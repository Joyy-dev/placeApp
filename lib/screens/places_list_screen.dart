import 'package:flutter/material.dart';
import 'package:placeapp/screens/add_places_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: const Text('Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.routeName);
            }, 
            icon: const Icon(Icons.add)
          )
        ],
      ),

      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}