import 'dart:convert';

import 'package:fen_ghadi/components/google_autocompete.dart';
import 'package:fen_ghadi/components/transport_data_sheet.dart';
import 'package:fen_ghadi/models/bus.dart';
import 'package:fen_ghadi/models/bus_station.dart';
import 'package:fen_ghadi/models/bus_transportation.dart';
import 'package:fen_ghadi/models/static_data.dart';
import 'package:fen_ghadi/models/taxi_station.dart';
import 'package:fen_ghadi/models/taxi_transportation.dart';
import 'package:fen_ghadi/models/tram_stations.dart';
import 'package:fen_ghadi/models/tram_transportation.dart';
import 'package:fen_ghadi/models/transport_data.dart';
import 'package:flutter/material.dart';
import 'package:fen_ghadi/components/main_map.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

import '../utils/fen_ghadi_icons_icons.dart';
import '../utils/style.dart';

class HomePage extends StatefulWidget {
  final bool isTaxiChecked;
  final bool isBusChecked;
  final bool isTramChecked;
  const HomePage(
      {super.key,
      required this.isTaxiChecked,
      required this.isBusChecked,
      required this.isTramChecked});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //! Start: Get Location Permission : OutBuild
  Location location = Location();
  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
    generateMapMarkers();
  }

  void _checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();

    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _getLocation();
  }

  void _getLocation() async {
    try {
      _locationData = await location.getLocation();
      setState(() {
        _start =
            LatLng(_locationData?.latitude ?? 0, _locationData?.longitude ?? 0);
      });
    } catch (e) {
      print('Could not get the user\'s location: $e');
    }
  }
  //! End : getting permission : OutBuild

  //! Start: Map Markers and Routing : OutBuild
  List<Marker> markers = [];
  Marker? userLocation;
  Marker? userDestination;
  List<LatLng> passedRoutePoints = [];

  //Routing
  LatLng _start = LatLng(0, 0);
  LatLng _end = LatLng(0, 0);
  LatLng _destination = LatLng(0, 0);
  //! End: Map Markers and Routing : OutBuild

  //! Start: Getting the coordinate of destination : OutBuild
  Future<void> getLocationFromPlaceId(String placeId, String apiKey) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey";

    var response = await http.get(Uri.parse(url));
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    Map<String, double> location = {
      "lat": jsonData["result"]["geometry"]["location"]["lat"],
      "lng": jsonData["result"]["geometry"]["location"]["lng"]
    };

    _destination = LatLng(jsonData["result"]["geometry"]["location"]["lat"],
        jsonData["result"]["geometry"]["location"]["lng"]);
    setState(() {
      userDestination = Marker(
        point: LatLng(location['lat']!, location['lng']!),
        builder: (context) => const Icon(
          Icons.add_location_alt,
          color: Colors.green,
          size: 40.0,
        ),
      );
    });

    // return location;
  }
  //! End: Getting the coordinate of destination : OutBuild

  //! UI variables
  bool isBackButtonVisible = false;
  bool isSearchBarVisible = true;

  void generateMapMarkers() {
    // Taxi Markers
    List<Marker> taxiMarkers = StaticData.taxiStations
        .map(
          (taxiStation) => Marker(
            point: taxiStation.location,
            builder: ((ctx) => InkResponse(
                  onTap: () {
                    // Fluttertoast.showToast(msg: taxiStation.name);
                    print("----------------Taxi--------------");
                    print(StaticData.taxiStations);
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return TransportDataSheet(
                          transportData: taxiStation.taxiList
                              .map(
                                (taxi) => TransportData(
                                    name: taxi.name,
                                    duration: taxi.duration,
                                    price: taxi.price,
                                    icon: FenGhadiIcons.taxi,
                                    color: fgYellow,
                                    taxi: taxi),
                              )
                              .toList(),
                          isTaxi: true,
                          stationName: taxiStation.name,
                          sendTaxiStations:
                              (List<TaxiStation> gettedTaxiStations) {
                            setState(() {
                              passedRoutePoints = gettedTaxiStations
                                  .map((station) => station.location)
                                  .toList();
                              isBackButtonVisible = true;
                              Navigator.pop(context);
                              isSearchBarVisible = false;
                              generateTaxiMarkers(gettedTaxiStations);
                            });
                          },
                        );
                      },
                    );
                  },
                  child: Icon(
                    FenGhadiIcons.marker_taxi,
                    size: 50.0,
                    color: fgOrange,
                  ),
                )),
          ),
        )
        .toList();
    // Bus Markers
    List<Marker> busMarkers = StaticData.busStations
        .map(
          (busStation) => Marker(
            point: busStation.location,
            builder: (ctx) => InkResponse(
              onTap: () {
                // Fluttertoast.showToast(msg: busStation.name);
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return TransportDataSheet(
                      transportData: busStation.busList
                          .map(
                            (bus) => TransportData(
                              name: bus.name,
                              duration: bus.duration,
                              price: bus.price,
                              icon: FenGhadiIcons.bus,
                              color: fgBlue,
                              bus: bus,
                            ),
                          )
                          .toList(),
                      isBus: true,
                      stationName: busStation.name,
                      sendBusStations: (List<BusStation> gettedBusStations) {
                        setState(() {
                          passedRoutePoints = gettedBusStations
                              .map((station) => station.location)
                              .toList();
                          isBackButtonVisible = true;
                          Navigator.pop(context);
                          isSearchBarVisible = false;
                          generateBusStationMarkers(gettedBusStations);
                        });
                      },
                      // childPressed: () {
                      //   passedRoutePoints = StaticData.busList['L3']!.stations
                      //       .map((station) => station.location)
                      //       .toList();
                      // },
                    );
                  },
                );
              },
              child: Icon(
                FenGhadiIcons.marker_bus,
                size: 50.0,
                color: fgBlue,
              ),
            ),
          ),
        )
        .toList();
    // Tram Markers
    List<Marker> tramMarkers = StaticData.tramStations
        .map(
          (tramStation) => Marker(
            point: tramStation.location,
            builder: (ctx) => InkResponse(
              onTap: () {
                Fluttertoast.showToast(msg: tramStation.name);
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return TransportDataSheet(
                      transportData: tramStation.tramList
                          .map(
                            (tram) => TransportData(
                              name: tram.name,
                              duration: tram.duration,
                              price: tram.price,
                              icon: FenGhadiIcons.tram,
                              color: fgRed,
                              tram: tram,
                            ),
                          )
                          .toList(),
                      isTram: true,
                      stationName: tramStation.name,
                      sendTramStations: (List<TramStation> gettedTramStations) {
                        setState(() {
                          passedRoutePoints = gettedTramStations
                              .map((station) => station.location)
                              .toList();
                          print(r"OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO");
                          print(gettedTramStations);
                          isBackButtonVisible = true;
                          Navigator.pop(context);
                          isSearchBarVisible = false;
                          generateTramMarkers(gettedTramStations);
                        });
                      },
                    );
                  },
                );
              },
              child: Icon(
                FenGhadiIcons.marker_tram,
                size: 50.0,
                color: fgRed,
              ),
            ),
          ),
        )
        .toList();
    markers.clear();

    //Combining Markers
    if (widget.isBusChecked) markers += busMarkers;
    if (widget.isTaxiChecked) markers += taxiMarkers;
    if (widget.isTramChecked) markers += tramMarkers;

    //Current User Marker
    if (_locationData != null) {
      userLocation = Marker(
        point:
            LatLng(_locationData?.latitude ?? 0, _locationData?.longitude ?? 0),
        builder: (ctx) => const Icon(
          Icons.location_on_rounded,
          color: Colors.red,
          size: 30.0,
        ),
      );
      markers.add(userLocation!);
    }

    //User Destination Marker
    if (userDestination != null) {
      markers.add(userDestination!);
    }
  }

  void generateBusStationMarkers(List<BusStation> busStations) {
    setState(() {
      markers = busStations
          .map(
            (busStation) => Marker(
              point: busStation.location,
              builder: (ctx) => InkResponse(
                onTap: () {
                  // Fluttertoast.showToast(msg: busStation.name);
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return TransportDataSheet(
                        transportData: busStation.busList
                            .map(
                              (bus) => TransportData(
                                name: bus.name,
                                duration: bus.duration,
                                price: bus.price,
                                icon: FenGhadiIcons.bus,
                                color: fgBlue,
                                bus: bus,
                              ),
                            )
                            .toList(),
                        isBus: true,
                        stationName: busStation.name,
                        sendBusStations: (List<BusStation> gettedBusStations) {
                          setState(() {
                            passedRoutePoints = gettedBusStations
                                .map((station) => station.location)
                                .toList();
                            isBackButtonVisible = true;
                            Navigator.pop(context);
                            isSearchBarVisible = false;
                            generateBusStationMarkers(gettedBusStations);
                          });
                        },
                        // childPressed: () {
                        //   passedRoutePoints = StaticData.busList['L3']!.stations
                        //       .map((station) => station.location)
                        //       .toList();
                        // },
                      );
                    },
                  );
                },
                child: Icon(
                  FenGhadiIcons.marker_bus,
                  size: 50.0,
                  color: fgBlue,
                ),
              ),
            ),
          )
          .toList();
    });
  }

  void generateTramMarkers(List<TramStation> tramStations) {
    setState(() {
      markers = tramStations
          .map(
            (tramStation) => Marker(
              point: tramStation.location,
              builder: (ctx) => InkResponse(
                onTap: () {
                  // Fluttertoast.showToast(msg: busStation.name);
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return TransportDataSheet(
                        transportData: tramStation.tramList
                            .map(
                              (tram) => TransportData(
                                name: tram.name,
                                duration: tram.duration,
                                price: tram.price,
                                icon: FenGhadiIcons.bus,
                                color: fgBlue,
                                tram: tram,
                              ),
                            )
                            .toList(),
                        isTram: true,
                        stationName: tramStation.name,
                        sendTramStations:
                            (List<TramStation> gettedTramStations) {
                          setState(() {
                            passedRoutePoints = gettedTramStations
                                .map((station) => station.location)
                                .toList();
                            isBackButtonVisible = true;
                            Navigator.pop(context);
                            isSearchBarVisible = false;
                            generateTramMarkers(gettedTramStations);
                          });
                        },
                        // childPressed: () {
                        //   passedRoutePoints = StaticData.busList['L3']!.stations
                        //       .map((station) => station.location)
                        //       .toList();
                        // },
                      );
                    },
                  );
                },
                child: Icon(
                  FenGhadiIcons.marker_tram,
                  size: 50.0,
                  color: fgRed,
                ),
              ),
            ),
          )
          .toList();
    });
  }

  void generateTaxiMarkers(List<TaxiStation> taxiStations) {
    setState(() {
      markers = taxiStations
          .map(
            (taxiStation) => Marker(
              point: taxiStation.location,
              builder: ((context) => GestureDetector(
                    onDoubleTap: () {
                      Fluttertoast.showToast(msg: 'msg');
                    },
                    onTap: () {
                      // Fluttertoast.showToast(msg: taxiStation.name);
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return TransportDataSheet(
                            transportData: taxiStation.taxiList
                                .map(
                                  (taxi) => TransportData(
                                    name: taxi.name,
                                    duration: taxi.duration,
                                    price: taxi.price,
                                    icon: FenGhadiIcons.taxi,
                                    color: fgYellow,
                                    taxi: taxi,
                                  ),
                                )
                                .toList(),
                            isTaxi: true,
                            stationName: taxiStation.name,
                            sendTaxiStations:
                                (List<TaxiStation> gettedTaxiStations) {
                              setState(() {
                                passedRoutePoints = gettedTaxiStations
                                    .map((station) => station.location)
                                    .toList();
                                isBackButtonVisible = true;
                                Navigator.pop(context);
                                isSearchBarVisible = false;
                                generateTaxiMarkers(gettedTaxiStations);
                              });
                            },
                          );
                        },
                      );
                    },
                    child: Icon(
                      FenGhadiIcons.marker_taxi,
                      size: 50.0,
                      color: fgOrange,
                    ),
                  )),
            ),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    print("_______________Before it send to the map_________________");
    print(passedRoutePoints);
    // //!Start : prepare Transportation Data : InBuild
    //? Assign Statios to each bus
    for (var key in StaticData.busList.keys) {
      StaticData.busList[key]?.stations = StaticData.busTransportations
          .where((busTransportation) =>
              busTransportation.bus == StaticData.busList[key])
          .map((busTransportation) => busTransportation.busStation)
          .toList();
    }

    //? Assign busList For each Station
    for (var key in StaticData.busStationsList.keys) {
      StaticData.busStationsList[key]?.busList = StaticData.busTransportations
          .where((busTransportation) =>
              busTransportation.busStation == StaticData.busStationsList[key])
          .map((busTransportation) => busTransportation.bus)
          .toList();
    }

    //? Assign Stations to each Tram
    for (var key in StaticData.tramList.keys) {
      StaticData.tramList[key]?.stations = StaticData.tramTransportation
          .where((tramTransportation) =>
              tramTransportation.tram == StaticData.tramList[key])
          .map((tramTransportation) => tramTransportation.tramStation)
          .toList();
    }
    //? Assign busList For each Station
    for (var key in StaticData.tramStationList.keys) {
      StaticData.tramStationList[key]?.tramList = StaticData.tramTransportation
          .where((tramTransportation) =>
              tramTransportation.tramStation == StaticData.tramStationList[key])
          .map((tramTransportation) => tramTransportation.tram)
          .toList();
    }

    //? Assign Stations to each Taxi
    for (var key in StaticData.taxiList.keys) {
      StaticData.taxiList[key]?.stations = StaticData.taxiTransportations
          .where((taxiTransportation) =>
              taxiTransportation.taxi == StaticData.taxiList[key])
          .map((TaxiTransporation) => TaxiTransporation.taxiStation)
          .toList();
    }
    //? Assign taxiList For each Station
    for (var key in StaticData.taxiStationList.keys) {
      StaticData.taxiStationList[key]?.taxiList = StaticData.taxiTransportations
          .where((taxiTransportation) =>
              taxiTransportation.taxiStation == StaticData.taxiStationList[key])
          .map((taxiTransportation) => taxiTransportation.taxi)
          .toList();
    }
    // //!End : prepare Transportation Data : InBuild
    //! Start: prepare Map Markers : InBuild
    //! End: Prepare Map Markers : InBuild
    //! Start: Scaffold Widget : InBuild
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          MainMap(
            gettedMarkers: markers,
            // start: _start,
            // end: _end,
            listPoints: passedRoutePoints,
          ),
          Visibility(
            visible: isSearchBarVisible,
            child: Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: GoogleAutocomplete(getPlaceId: (str) async {
                await getLocationFromPlaceId(str, apiKey);

                setState(() {
                  _start = LatLng(_locationData?.latitude ?? 0,
                      _locationData?.longitude ?? 0);
                  _end = LatLng(_destination.latitude, _destination.longitude);
                });
              }),
            ),
          ),
          Visibility(
            visible: isBackButtonVisible,
            child: Positioned(
                top: 20,
                left: 20,
                height: 50,
                width: 50,
                child: ElevatedButton(
                  child: const Icon(
                    FenGhadiIcons.arrow_left,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      passedRoutePoints = [];
                      isBackButtonVisible = false;
                      isSearchBarVisible = true;
                      generateMapMarkers();
                    });
                  },
                )),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _getLocation();
            if (_locationData != null) {
              userLocation = Marker(
                point: LatLng(_locationData?.latitude ?? 0,
                    _locationData?.longitude ?? 0),
                builder: (ctx) => const Icon(
                  Icons.location_on_rounded,
                  color: Colors.red,
                  size: 30.0,
                ),
              );
              markers.add(userLocation!);
            }
          });
        },
        backgroundColor: primaryColor,
        child: const Icon(
          Icons.my_location_outlined,
          color: Colors.white,
        ),
      ),
    );
    //! End: Scaffold Widget : InBuild
  }
}
