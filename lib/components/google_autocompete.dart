import 'package:fen_ghadi/components/location_list_tile.dart';
import 'package:fen_ghadi/components/network_utility.dart';
import 'package:fen_ghadi/models/autocomplate_prediction.dart';
import 'package:fen_ghadi/models/place_autotcomplete_response.dart';
import 'package:fen_ghadi/utils/style.dart';
import 'package:flutter/material.dart';

class GoogleAutocomplete extends StatefulWidget {
  final Function(String str) getPlaceId;
  const GoogleAutocomplete({super.key, required this.getPlaceId});

  @override
  State<GoogleAutocomplete> createState() => _GoogleAutocompleteState();
}

class _GoogleAutocompleteState extends State<GoogleAutocomplete> {
  List<AutocompletePrediction> placePredictions = [];
  bool isSuggestionsVisible = true;

  void placeAutocomplete(String query) async {
    Uri uri = Uri.https(
      "maps.googleapis.com",
      'maps/api/place/autocomplete/json',
      {
        "input": query,
        "key": apiKey,
        "components": "country:ma",
      },
    );
    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        placePredictions = result.predictions!;
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 100.0,
      child: Column(
        children: [
          TextFormField(
            onSaved: (newValue) {},
            decoration: const InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search for your destination ...",
                labelText: "Destination"),
            onChanged: (query) {
              isSuggestionsVisible = true;
              placeAutocomplete(query);
            },
            // LocationListTile(),
          ),
          Visibility(
            visible: isSuggestionsVisible,
            child: Column(
              children: placePredictions
                  .map(
                    (e) => LocationListTile(
                      location: e.description!,
                      press: () {
                        widget.getPlaceId(e.placeId!);
                        e.fetchPlaceDetails(e.placeId);
                        setState(() {
                          isSuggestionsVisible = false;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
          )
          // ListView.builder(
          //   itemCount: placePredictions.length,
          //   itemBuilder: (context, index) => LocationListTile(
          //     location: placePredictions[index].description!,
          //     press: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
