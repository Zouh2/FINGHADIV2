import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class MainMap extends StatefulWidget {
  final List<Marker> gettedMarkers;
  final LatLng? start;
  final LatLng? end;
  final List<LatLng>? listPoints;
  const MainMap({
    Key? key,
    required this.gettedMarkers,
    this.start,
    this.end,
    this.listPoints,
  }) : super(key: key);

  @override
  State<MainMap> createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  List<LatLng> routpoints = [];

  @override
  void initState() {
    super.initState();
    fillRoutePoints();
  }

  Future<List<LatLng>> gettingRoutes(List<LatLng> points) async {
    final url = "http://router.project-osrm.org/route/v1/driving/" +
        points.map((e) => "${e.longitude},${e.latitude}").join(";") +
        "?steps=true&annotations=true&geometries=geojson&overview=full";

    final response = await http.get(Uri.parse(url));
    final jsonData = jsonDecode(response.body);
    final routeCoordinates = jsonData['routes'][0]['geometry']['coordinates'];

    final routePoints = <LatLng>[];
    for (int i = 0; i < routeCoordinates.length; i++) {
      var reep = routeCoordinates[i].toString();
      reep = reep.replaceAll("[", "");
      reep = reep.replaceAll("]", "");
      final lat1 = reep.split(',');
      final long1 = reep.split(",");
      routePoints.add(LatLng(double.parse(lat1[1]), double.parse(long1[0])));
    }
    return routePoints;
  }

  void fillRoutePoints() async {
    if (widget.listPoints != null && widget.listPoints!.isNotEmpty) {
      routpoints = await gettingRoutes(widget.listPoints!);
    } else if (widget.start != null && widget.end != null) {
      await getRoutes(widget.start!, widget.end!);
    }
    setState(() {
      if (widget.listPoints!.isEmpty) {
        routpoints = [];
      }
    });
  }

  Future<void> getRoutes(LatLng start, LatLng end) async {
    final url = Uri.parse(
        'http://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?steps=true&annotations=true&geometries=geojson&overview=full');

    final response = await http.get(url);
    final ruter =
        jsonDecode(response.body)['routes'][0]['geometry']['coordinates'];

    routpoints = ruter.map((e) {
      var reep = e.toString();
      reep = reep.replaceAll("[", "");
      reep = reep.replaceAll("]", "");
      final lat1 = reep.split(',');
      final long1 = reep.split(",");
      return LatLng(double.parse(lat1[1]), double.parse(long1[0]));
    }).toList();

    print("here here" + routpoints.toString());
  }

  @override
  Widget build(BuildContext context) {
    fillRoutePoints();
    // () async {
    //   if (widget.listPoints != null && widget.listPoints!.isNotEmpty) {
    //     routpoints = await gettingRoutes(widget.listPoints!);
    //   }
    // };

    // print(r"$$$$$$$$$$$$$$---Start---$$$$$$$$$$$");
    // print(widget.start);
    // print(r"$$$$$$$$$$$$$$---end---$$$$$$$$$$$");
    // print(widget.end);
    // if (widget.start != null &&
    //     widget.end != null &&
    //     widget.start != LatLng(0, 0) &&
    //     widget.end != LatLng(0, 0)) {
    //   getRoutes(widget.start!, widget.end!);
    // }
    // updateRoutePoints();
    print("_______________MAP List Point /from parent_______________");
    print(widget.listPoints!.isEmpty ? 'is Empty' : 'is not Empty');
    print("_______________MAP RoutPoints_______________");
    print(routpoints);

    return FlutterMap(
        options: MapOptions(
          zoom: 14.0,
          center: LatLng(33.9715904, -6.8498129),
          interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
          onLongPress: (tapPosition, point) {
            print(
                point.latitude.toString() + ", " + point.longitude.toString());
          },
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://tile.thunderforest.com/atlas/{z}/{x}/{y}.png?apikey=c729f1b69fd24f8ea3e3c99785551dd5',
            userAgentPackageName: 'ma.fenghadi.app.fen_ghadi',
          ),
          PolylineLayer(
            polylineCulling: false,
            polylines: [
              Polyline(
                points: routpoints == [] ? [] : routpoints,
                color: Colors.blue,
                strokeWidth: 6,
              ),
            ],
          ),
          MarkerLayer(
            markers: widget.gettedMarkers,
          ),
        ]);
  }
}
