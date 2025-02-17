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

      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
        ? const Center(child: CircularProgressIndicator()) 
        : Consumer<GreatPlaces>(       
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
                  subtitle: Text(greatPlaces.places[index].location?.address ?? 'No address available'),
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.places[index].image),
                  ),
                  onTap: () {},
                );
              }
            );
          }}  
        ),
      )
    );
  }
}