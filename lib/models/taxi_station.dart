import 'package:fen_ghadi/models/taxi.dart';
import 'package:latlong2/latlong.dart';

class TaxiStation {
  final String name;
  final LatLng location;
  List<Taxi> taxiList = [];

  TaxiStation({
    required this.name,
    required this.location,
  });
}
