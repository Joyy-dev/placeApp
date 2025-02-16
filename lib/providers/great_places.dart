import 'dart:io';

import 'package:flutter/material.dart';
import 'package:placeapp/helpers/db_helper.dart';
import 'package:placeapp/helpers/location_helper.dart';
import 'package:placeapp/models/places.dart';

class GreatPlaces with ChangeNotifier {
  List<Places> _places = [];

  List<Places> get places{
    return [..._places];
  }

  Future<void> addPlace(String pickedTitle, File pickedImage, PlaceLocation pickedLocation) async{
    final address = await LocationHelper.getPlacesAddress(pickedLocation.latitude, pickedLocation.longitude);
    final updatedLocation = PlaceLocation(latitude: pickedLocation.latitude, longitude: pickedLocation.longitude, address: address);
    final newPlace = Places(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: updatedLocation,
      image: pickedImage,
    );
    _places.add(newPlace);
    notifyListeners();
    DbHelper.insert('Places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetPlaces () async{
    final dataList = await DbHelper.getData('Places');
    _places = dataList.map((places) => Places(
      id: places['id'], 
      title: places['title'], 
      location: null, 
      image: File(places['image']),
    )).toList();
  }
}