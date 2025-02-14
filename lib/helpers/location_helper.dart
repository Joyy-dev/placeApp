const GOOGLE_API_KEY = 'YOUR_API_KEY';

class LocationHelper {
  static String getDirectionsUrl(double longitude, double latitude) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$longitude, $longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:indigo%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&key=$GOOGLE_API_KEY&signature=YOUR_SIGNATURE';
  }
}