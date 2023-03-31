import 'package:flutter/material.dart';

const String apiKey = 'AIzaSyDa5PUgpGklfrXSW8UHBpMp_G-1DIvNB7Y';

var primaryColor = const Color(0xFFF9A826);
var secondaryColor = const Color(0xFF3F3D56);
var fgBlue = const Color(0xFF3DBDD8);
var fgOrange = const Color(0xFFF47216);
var fgRed = const Color(0xFFE43828);
var fgYellow = const Color(0xFFFFD600);
var fgLightOrange = const Color(0xFFFFEED3);

var materialPrimaryColor = MaterialColor(primaryColor.value, primarySwatch);
var materialSecondaryColor =
    MaterialColor(secondaryColor.value, secondarySwatch);

Map<int, Color> primarySwatch = {
  50: const Color.fromRGBO(249, 168, 38, .1),
  100: const Color.fromRGBO(249, 168, 38, .2),
  200: const Color.fromRGBO(249, 168, 38, .3),
  300: const Color.fromRGBO(249, 168, 38, .4),
  400: const Color.fromRGBO(249, 168, 38, .5),
  500: const Color.fromRGBO(249, 168, 38, .6),
  600: const Color.fromRGBO(249, 168, 38, .7),
  700: const Color.fromRGBO(249, 168, 38, .8),
  800: const Color.fromRGBO(249, 168, 38, .9),
  900: const Color.fromRGBO(249, 168, 38, 1),
};
Map<int, Color> secondarySwatch = {
  50: const Color.fromRGBO(63, 61, 86, .1),
  100: const Color.fromRGBO(63, 61, 86, .2),
  200: const Color.fromRGBO(63, 61, 86, .3),
  300: const Color.fromRGBO(63, 61, 86, .4),
  400: const Color.fromRGBO(63, 61, 86, .5),
  500: const Color.fromRGBO(63, 61, 86, .6),
  600: const Color.fromRGBO(63, 61, 86, .7),
  700: const Color.fromRGBO(63, 61, 86, .8),
  800: const Color.fromRGBO(63, 61, 86, .9),
  900: const Color.fromRGBO(63, 61, 86, 1),
};
