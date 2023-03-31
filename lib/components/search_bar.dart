import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';

class SearchBar extends StatefulWidget {
  final Function(LatLng) onSearch;

  SearchBar({required this.onSearch});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search for a place...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final query = _controller.text;
              if (query.isNotEmpty) {
                final places = await locationFromAddress(query);
                if (places.isNotEmpty) {
                  final place = places.first;
                  widget.onSearch(LatLng(place.latitude, place.longitude));
                }
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
