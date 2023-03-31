import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:fen_ghadi/utilss.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final String email = 'anouarzouhri66@gmail.com';
  final String phone = '+212770498886';
  final String address = 'ESTS - Ecole Supérieure de Technologie - Salé';

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:Colors.black),
        centerTitle: true,
        title: Text(
          'Contact Us',
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Contact us for any inquiries or support',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text('Email'),
                subtitle: Text(email),
                onTap: () => launch('mailto:$email'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text('Phone'),
                subtitle: Text(phone),
                onTap: () => launch('tel:$phone'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on),
                title: Text('Address'),
                subtitle: Text(address),
                onTap: () => launch('https://www.google.com/maps/search/?api=1&query=$address'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
