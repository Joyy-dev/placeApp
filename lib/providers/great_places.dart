import 'package:flutter/material.dart';
import 'package:placeapp/models/places.dart';

class GreatPlaces with ChangeNotifier {
  final List<Places> _places = [];

  List<Places> get places{
    return [..._places];
  }
}