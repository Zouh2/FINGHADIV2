import 'package:fen_ghadi/models/tram_stations.dart';

class Tram {
  String name;
  double price = 7.0;
  Duration duration;
  List<TramStation> stations = [];

  /// Start Position ///
  /// Finish Position ///
  /// List of Stations Pass From///

  Tram(this.name, this.duration);
}
