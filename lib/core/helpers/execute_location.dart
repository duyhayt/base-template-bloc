import 'package:base_template_bloc/features/presentation/gpx/models/location_model.dart';
import 'package:gpx/gpx.dart';
import 'package:latlong2/latlong.dart';
import 'package:xml/xml.dart';

class LocationAnalysis {
  Future<LocationModel> locationAnalysis(String filePath) async {
    // Phân tích nội dung XML để trích xuất thẻ <name>
    final xmlDoc = XmlDocument.parse(filePath);
    final nameElement =
        xmlDoc.findAllElements('metadata').first.findAllElements('name').first;

    // Phân tích the GPX content
    final gpx = GpxReader().fromString(filePath);

    // Đọc các thông tin của vị trí
    final waypoints =
        gpx.wpts.map((wpt) => LatLng(wpt.lat!, wpt.lon!)).toList();
    final trackPoints = gpx.trks
        .expand((trk) => trk.trksegs.expand(
            (trkseg) => trkseg.trkpts.map((pt) => LatLng(pt.lat!, pt.lon!))))
        .toList();
    final routePoints = gpx.rtes
        .expand((rte) => rte.rtepts.map((pt) => LatLng(pt.lat!, pt.lon!)))
        .toList();

    return LocationModel(
        name: nameElement.text,
        waypoints: waypoints,
        trackPoints: trackPoints,
        routePoints: routePoints);
  }
}
