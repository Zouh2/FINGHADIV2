import 'package:fen_ghadi/models/tram.dart';
import 'package:latlong2/latlong.dart';

class TramStation {
  final String name;
  final LatLng location;
  List<Tram> tramList = [];

  TramStation(this.name, this.location);
}
