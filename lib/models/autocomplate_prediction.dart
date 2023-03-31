import 'dart:convert';

import 'package:fen_ghadi/utils/style.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class AutocompletePrediction {
  /// [description] contains the human-readable name for the returned result. For establishment results, this is usually
  /// the business name.
  final String? description;

  /// [structuredFormatting] provides pre-formatted text that can be shown in your autocomplete results
  final StructuredFormatting? structuredFormatting;

  /// [placeId] is a textual identifier that uniquely identifies a place. To retrieve information about the place,
  /// pass this identifier in the placeId field of a Places API request. For more information about place IDs.
  final String? placeId;

  /// [reference] contains reference.
  final String? reference;

  /// [latitude] contains the latitude of the place
  double? latitude;

  /// [longitude] contains the longitude of the place
  double? longitude;

  AutocompletePrediction({
    this.description,
    this.structuredFormatting,
    this.placeId,
    this.reference,
    this.latitude,
    this.longitude,
  });

  factory AutocompletePrediction.fromJson(Map<String, dynamic> json) {
    return AutocompletePrediction(
      description: json['description'] as String?,
      placeId: json['place_id'] as String?,
      reference: json['reference'] as String?,
      latitude: null,
      longitude: null,
      structuredFormatting: json['structured_formatting'] != null
          ? StructuredFormatting.fromJson(json['structured_formatting'])
          : null,
    );
  }

  Future<LatLng> fetchPlaceDetails(String? fgPlaceId) async {
    final Uri uri = Uri.https(
        'maps.googleapis.com', '/maps/api/place/details/json', <String, String>{
      'place_id': fgPlaceId!,
      'fields': 'geometry/location',
      'key': apiKey,
    });

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final location = responseData['result']['geometry']['location'];
      latitude = location['lat'];
      longitude = location['lng'];
      return LatLng(latitude!, longitude!);
    } else {
      throw Exception('Failed to fetch place details');
    }
  }
}

class StructuredFormatting {
  /// [mainText] contains the main text of a prediction, usually the name of the place.
  final String? mainText;

  /// [secondaryText] contains the secondary text of a prediction, usually the location of the place.
  final String? secondaryText;

  StructuredFormatting({this.mainText, this.secondaryText});

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) {
    return StructuredFormatting(
      mainText: json['main_text'] as String?,
      secondaryText: json['secondary_text'] as String?,
    );
  }
}
