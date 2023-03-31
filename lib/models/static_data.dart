import 'package:fen_ghadi/models/bus_station.dart';
import 'package:fen_ghadi/models/bus_transportation.dart';
import 'package:fen_ghadi/models/taxi.dart';
import 'package:fen_ghadi/models/taxi_station.dart';
import 'package:fen_ghadi/models/taxi_transportation.dart';
import 'package:fen_ghadi/models/tram.dart';
import 'package:fen_ghadi/models/tram_stations.dart';
import 'package:fen_ghadi/models/tram_transportation.dart';
import 'package:latlong2/latlong.dart';
import 'bus.dart';

class StaticData {
  static List<TaxiStation> taxiStations = [
    TaxiStation(
      name: 'Minipark',
      location: LatLng(33.99319119958285, -6.818499300327625),
    ),
    TaxiStation(
      name: 'Hay nahda',
      location: LatLng(33.9790910326907, -6.813987787675005),
    ),
    TaxiStation(
      name: 'Agdal',
      location: LatLng(33.995553944425176, -6.8513333514172485),
    ),
    TaxiStation(
      name: 'Manal',
      location: LatLng(33.99039423070884, -6.877291974325247),
    ),
    TaxiStation(
      name: 'Sale el jadida',
      location: LatLng(33.98729591882331, -6.729246762549353),
    ),
    TaxiStation(
      name: 'Karya',
      location: LatLng(34.03108463843669, -6.756651470804838),
    ),
  ];
  static List<BusStation> busStations = [
    BusStation(
      'Takadoum',
      LatLng(33.9742133, -6.8344776),
    ),
    BusStation(
      'Minipark',
      LatLng(33.9926465, -6.8179552),
    ),
    BusStation(
      'Youssofia',
      LatLng(33.99690826804329, -6.815371579299652),
    ),
    BusStation(
      'Medina',
      LatLng(34.0096358, -6.8354934),
    ),
    BusStation(
      'Ocean',
      LatLng(34.0226221, -6.8445908),
    ),
    BusStation(
      'Temara ',
      LatLng(33.9362713, -6.9057512),
    ),
    BusStation(
      'Est ',
      LatLng(34.0515397, -6.8138573),
    ),
    BusStation(
      'Bouknadel',
      LatLng(34.12701860294961, -6.735920939815566),
    ),
  ];
  static List<TramStation> tramStations = [
    TramStation(
      'United Nations station',
      LatLng(33.9972507, -6.8424226),
    ),
    TramStation(
      'Bibliothéque Natioanle',
      LatLng(34.0081551, -6.8408133),
    ),
    TramStation(
      'GARE RABAT VILLE',
      LatLng(34.0138736, -6.8365325),
    ),
    TramStation(
      'Mosque Ashohada',
      LatLng(34.0257096, -6.8411781),
    ),
    TramStation(
      'Diar-V',
      LatLng(34.0387004, -6.818563),
    ),
    TramStation(
      'Bouzid 1',
      LatLng(34.052404, -6.8117959),
    ),
    TramStation(
      'Mazza-v',
      LatLng(34.0685301, -6.7609849),
    ),
    TramStation(
      'Tabriquet',
      LatLng(34.03493508501021, -6.806467880579064),
    ),
    TramStation(
      'Ibn al haytem',
      LatLng(34.05364663275742, -6.780499446832965),
    ),
  ];
  static List<Bus> buss = [
    Bus('L9', const Duration(minutes: 50)),
    Bus('L10', const Duration(minutes: 30)),
    Bus('L37', const Duration(minutes: 60)),
    Bus('L104', const Duration(minutes: 40)),
    Bus('L8', const Duration(minutes: 90)),
    Bus('L102', const Duration(minutes: 10)),
    Bus('L3', const Duration(minutes: 90)),
  ];
  static List<Taxi> taxiss = [
    Taxi('manal - minipark', 5.0, const Duration(minutes: 35)),
    Taxi('sale el jadida - minipark', 15.0, const Duration(minutes: 50)),
    Taxi('hay nahda - agdal', 5.0, const Duration(minutes: 20)),
    Taxi('agdal - karya', 13.0, const Duration(minutes: 40)),
    Taxi('manal - hay nahda', 5.0, const Duration(minutes: 45)),
  ];
  static List<Tram> trams = [
    Tram('L1', const Duration(minutes: 30)),
    Tram('L2', const Duration(minutes: 50)),
  ];

  static Map<String, Bus> busList = {
    'L102': buss[5],
    'L104': buss[3],
    'L9': buss[0],
    'L10': buss[1],
    'L37': buss[2],
    'L8': buss[4],
    'L3': buss[6],
  };
  static Map<String, BusStation> busStationsList = {
    'Minipark': busStations[1],
    'Takadoum': busStations[0],
    'Youssofia': busStations[2],
    'Medina': busStations[3],
    'Ocean': busStations[4],
    'Temara': busStations[5],
    'Est': busStations[6],
    'Bouknadel': busStations[7],
  };
  static Map<String, Tram> tramList = {
    'L1': trams[0],
    'L2': trams[1],
  };
  static Map<String, TramStation> tramStationList = {
    'United Nations station': tramStations[0],
    'Bibliothéque Natioanle': tramStations[1],
    'GARE RABAT VILLE': tramStations[2],
    'Mosque Ashohada': tramStations[3],
    'Diar-V': tramStations[4],
    'Bouzid 1': tramStations[5],
    'Mazza-v': tramStations[6],
    'Tabriquet': tramStations[7],
    'Ibn al haytem': tramStations[8]
  };
  static Map<String, Taxi> taxiList = {
    taxiss[0].name: taxiss[0],
    taxiss[1].name: taxiss[0],
    taxiss[2].name: taxiss[0],
    taxiss[3].name: taxiss[0],
    taxiss[4].name: taxiss[0],
  };
  static Map<String, TaxiStation> taxiStationList = {
    taxiStations[0].name: taxiStations[0],
    taxiStations[1].name: taxiStations[1],
    taxiStations[2].name: taxiStations[2],
    taxiStations[3].name: taxiStations[3],
    taxiStations[4].name: taxiStations[4],
    taxiStations[5].name: taxiStations[5],
    // taxiStations[6].name: taxiStations[6],
    // taxiStations[7].name: taxiStations[7],
    // taxiStations[8].name: taxiStations[8],
  };

  static List<TaxiTransporation> taxiTransportations = [
    TaxiTransporation(
      taxiList['manal - minipark']!,
      taxiStationList['Minipark']!,
    ),
    TaxiTransporation(
      taxiList['manal - minipark']!,
      taxiStationList['Manal']!,
    ),
    TaxiTransporation(
      taxiList['sale el jadida - minipark']!,
      taxiStationList['Sale el jadida']!,
    ),
    TaxiTransporation(
      taxiList['sale el jadida - minipark']!,
      taxiStationList['Minipark']!,
    ),
    TaxiTransporation(
      taxiList['hay nahda - agdal']!,
      taxiStationList['Hay nahda']!,
    ),
    TaxiTransporation(
      taxiList['hay nahda - agdal']!,
      taxiStationList['Agdal']!,
    ),
    TaxiTransporation(
      taxiList['agdal - karya']!,
      taxiStationList['Agdal']!,
    ),
    TaxiTransporation(
      taxiList['agdal - karya']!,
      taxiStationList['Karya']!,
    ),
    TaxiTransporation(
      taxiList['manal - hay nahda']!,
      taxiStationList['Manal']!,
    ),
    TaxiTransporation(
      taxiList['manal - hay nahda']!,
      taxiStationList['Hay nahda']!,
    ),
  ];
  static List<BusTransportation> busTransportations = [
    //Line 102
    BusTransportation(busList['L102']!, busStationsList['Takadoum']!),
    BusTransportation(busList['L102']!, busStationsList['Minipark']!),
    BusTransportation(busList['L102']!, busStationsList['Youssofia']!),
    BusTransportation(busList['L102']!, busStationsList['Medina']!),
    BusTransportation(busList['L102']!, busStationsList['Ocean']!),
    //Line 37
    BusTransportation(busList['L37']!, busStationsList['Minipark']!),
    BusTransportation(busList['L37']!, busStationsList['Takadoum']!),
    BusTransportation(busList['L37']!, busStationsList['Temara']!),
    //Line 3
    BusTransportation(busList['L3']!, busStationsList['Medina']!),
    BusTransportation(busList['L3']!, busStationsList['Est']!),
    BusTransportation(busList['L3']!, busStationsList['Bouknadel']!),
  ];
  static List<TramTransportation> tramTransportation = [
    //line 1
    TramTransportation(
        tramList['L1']!, tramStationList['United Nations station']!),
    TramTransportation(
        tramList['L1']!, tramStationList['Bibliothéque Natioanle']!),
    TramTransportation(tramList['L1']!, tramStationList['GARE RABAT VILLE']!),
    TramTransportation(tramList['L1']!, tramStationList['Mosque Ashohada']!),
    TramTransportation(tramList['L1']!, tramStationList['Diar-V']!),
    TramTransportation(tramList['L1']!, tramStationList['Bouzid 1']!),
    TramTransportation(tramList['L1']!, tramStationList['Mazza-v']!),
    //line 2
    TramTransportation(
        tramList['L2']!, tramStationList['United Nations station']!),
    TramTransportation(
        tramList['L2']!, tramStationList['Bibliothéque Natioanle']!),
    TramTransportation(tramList['L2']!, tramStationList['GARE RABAT VILLE']!),
    TramTransportation(tramList['L2']!, tramStationList['Mosque Ashohada']!),
    TramTransportation(tramList['L2']!, tramStationList['Diar-V']!),
    TramTransportation(tramList['L2']!, tramStationList['Tabriquet']!),
    TramTransportation(tramList['L2']!, tramStationList['Ibn al haytem']!),
  ];
}
