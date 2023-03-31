import 'package:fen_ghadi/models/taxi_station.dart';
import 'package:fen_ghadi/models/taxi_transportation.dart';

class Taxi {
  String name;
  double price;
  Duration duration;
  List<TaxiStation> stations = [];

  /// Start Position ///
  /// Finish Position ///
  /// List of Stations Pass From///

  Taxi(this.name, this.price, this.duration);
}
