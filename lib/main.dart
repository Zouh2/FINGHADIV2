import 'package:fen_ghadi/pages/home_page.dart';
import 'package:fen_ghadi/pages/preferences_page.dart';
import 'package:fen_ghadi/pages/profile_page.dart';
import 'package:fen_ghadi/screens/start.dart';
import 'package:fen_ghadi/utils/style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'utils/fen_ghadi_icons_icons.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Start(),
    );
  }
}

