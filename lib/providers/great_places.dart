import 'dart:io';

import 'package:flutter/material.dart';
import 'package:placeapp/helpers/db_helper.dart';
import 'package:placeapp/models/places.dart';

class GreatPlaces with ChangeNotifier {
  final List<Places> _places = [];

  List<Places> get places{
    return [..._places];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Places(
      id: DateTime.now().toString(),
      title: pickedTitle,
      location: null,
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
}