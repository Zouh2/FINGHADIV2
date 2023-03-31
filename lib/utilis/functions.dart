import 'package:latlong2/latlong.dart';

double calcDistance(LatLng point1, LatLng point2) {
  return const Distance().as(LengthUnit.Kilometer, point1, point2);
}
