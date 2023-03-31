import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utilss.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utilss.dart';

class Position extends StatefulWidget {
  @override
  _PositionState createState() => _PositionState();
}

class _PositionState extends State<Position> {
  final TextEditingController _startController = TextEditingController();
  final TextEditingController _endController = TextEditingController();

  // Declare variables to hold the home and work locations
  late double _homeLat;
  late double _homeLong;
  late double _workLat;
  late double _workLong;

  void _saveLocations(double homeLat, double homeLong, double workLat, double workLong) async {
    try {
      // Create a document reference for the current user
      DocumentReference docRef = FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);

      // Create a map of data to be saved
      Map<String, dynamic> data = {
        'home_location': GeoPoint(homeLat, homeLong),
        'work_location': GeoPoint(workLat, workLong),
        'home_name': _startController.text.trim(),
        'work_name': _endController.text.trim()
      };

      // Set the data for the document reference
      await docRef.set(data);
      print('Locations saved successfully!');
    } catch (e) {
      print('Error saving locations: $e');
    }
  }

  Future<List<Location>> _getLocationFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      return locations;
    } catch (e) {
      print('Error getting location from address: $e');
      throw Exception('Error getting location from address');
    }
  }


  void getUserData() async {
    final userDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final userData = await userDoc.get();
    setState(() {
      GeoPoint homeLocation = userData.get('home_location') as GeoPoint;
      GeoPoint workLocation = userData.get('work_location') as GeoPoint;
      String home = userData.get('home_name');
      String Work = userData.get('work_name');
      setState(() {
        _homeLat = homeLocation.latitude;
        _homeLong = homeLocation.longitude;
        _startController.text = home ;
        _workLat = workLocation.latitude;
        _workLong = workLocation.longitude;
        _endController.text = Work;
      });
    });
  }



  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:Colors.black),
        centerTitle: true,
        title: Text(
          'Les positions',
          style: SafeGoogleFont(
            'Ubuntu',
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.7,
            color: const Color(0xFF3F3D56),
          ),
        ),
        toolbarHeight: 60,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _startController,
              decoration: InputDecoration(
                hintText: 'Home Location ',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _endController,
              decoration:  InputDecoration(
                hintText: 'Work Location',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                List<Location> startLocations = await _getLocationFromAddress(_startController.text);
                List<Location> endLocations = await _getLocationFromAddress(_endController.text);

                if (startLocations.isNotEmpty && endLocations.isNotEmpty) {
                  double homeLat = startLocations[0].latitude;
                  double homeLong = startLocations[0].longitude;
                  double workLat = endLocations[0].latitude;
                  double workLong = endLocations[0].longitude;

                  _saveLocations(homeLat, homeLong, workLat, workLong);
                } else {
                  print('Error getting location information for one or both addresses');
                }
              },
              child: Text('Save Locations'),
            ),
          ],
        ),
      ),
    );
  }
}
