import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color c = Colors.redAccent;

// Colors
var primary = const Color(0xFF5DB075);
var accent = const Color(0xFF4B9460);
var heading = const Color(0xFF0F1641);
var text = Color.fromARGB(255, 86, 86, 86);
var iconColor = const Color(0xFFB8BCCB);
var background = const Color(0xFFF8FAFB);
var white = const Color(0xFFFFFFFF);
var black = const Color(0xFF000000);

//Text Style
TextStyle heading1 = GoogleFonts.poppins(
    fontSize: 20.0, fontWeight: FontWeight.w600, color: heading);
TextStyle heading2 = GoogleFonts.poppins(
    fontSize: 18.0, fontWeight: FontWeight.w600, color: heading);
TextStyle heading3 = GoogleFonts.poppins(
    fontSize: 16.0, fontWeight: FontWeight.w600, color: heading);
TextStyle heading4 = GoogleFonts.poppins(
    fontSize: 14.0, fontWeight: FontWeight.w600, color: heading);

TextStyle pBold = GoogleFonts.poppins(
    fontSize: 18, fontWeight: FontWeight.w700, color: black);

TextStyle p1 = GoogleFonts.poppins(
    fontSize: 14.0, fontWeight: FontWeight.w400, color: text);
TextStyle p2 = GoogleFonts.poppins(
    fontSize: 12.0, fontWeight: FontWeight.w400, color: text);
TextStyle p3 = GoogleFonts.poppins(
    fontSize: 10.0, fontWeight: FontWeight.w400, color: text);

TextStyle tButton = GoogleFonts.poppins(
    fontSize: 14.0, fontWeight: FontWeight.w500, color: white);
TextStyle tButtonSecondary = GoogleFonts.poppins(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  color: Colors.green,
);

TextStyle tileTitle = GoogleFonts.poppins(
  fontSize: 15.0,
  color: Colors.grey[700],
);

//Gaps
var large = 40.0;
var medium = 30.0;
var small = 16.0;
var xsmall = 10.0;
