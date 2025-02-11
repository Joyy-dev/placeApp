import 'package:flutter/material.dart';
import 'package:placeapp/providers/great_places.dart';
import 'package:placeapp/screens/add_places_screen.dart';
import 'package:provider/provider.dart';

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

      body: Consumer<GreatPlaces>(
        builder: (context, greatPlaces, ch) {
          if (greatPlaces.places.isEmpty) {
            return const Center(
             child: Text('Got no places yet, start adding some!')
           );
          } else {
            return ListView.builder(
            itemCount: greatPlaces.places.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(greatPlaces.places[index].title),
                leading: CircleAvatar(
                  backgroundImage: FileImage(greatPlaces.places[index].image),
                ),
                onTap: () {},
              );
            }
          );
        }}
        
      )
    );
  }
}