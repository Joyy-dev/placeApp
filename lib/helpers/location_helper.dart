import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'YOUR_API_KEY';

class LocationHelper {
  static String getDirectionsUrl(double longitude, double latitude) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$longitude, $longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:indigo%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&key=$GOOGLE_API_KEY&signature=YOUR_SIGNATURE';
  }

  static Future<String> getPlacesAddress(double latitude, double longitude) async{
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY';
    final response = await http.get(Uri.parse(url));
    return json.decode(response.body)['result'][0]['formatted_address'];
  }
}