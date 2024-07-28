import 'package:latlong2/latlong.dart';

class LocationModel {
  final String name;
  final List<LatLng> waypoints;
  final List<LatLng> trackPoints;
  final List<LatLng> routePoints;

  LocationModel({
    required this.name,
    required this.waypoints,
    required this.trackPoints,
    required this.routePoints,
  });
}
