import 'package:fen_ghadi/models/bus.dart';
import 'package:latlong2/latlong.dart';

class BusStation {
  final String name;
  final LatLng location;
  List<Bus> busList = [];

  BusStation(
    this.name,
    this.location,
  );
}
