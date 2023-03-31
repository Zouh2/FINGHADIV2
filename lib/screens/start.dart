import 'package:fen_ghadi/MyApp.dart';
import 'package:fen_ghadi/screens/Second.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:fen_ghadi/utilss.dart';



class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // phoneDKb (1:5461)
          padding: EdgeInsets.fromLTRB(30*fem, 20*fem, 23*fem, 25*fem),
          width: double.infinity,
          decoration: const BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(

                margin: EdgeInsets.fromLTRB(280*fem, 0*fem, 0*fem, 76*fem),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyAppMain()),
                    );
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Skip',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 18*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff2f2e41),
                    ),
                  ),
                ),
              ),
              Container(
                // group3KG9 (1:5469)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 44.39*fem, 68*fem),
                width: 248.61*fem,
                height: 200*fem,
                child: Image.asset(
                  'lib/images/group-3.png',
                  width: 248.61*fem,
                  height: 200*fem,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 98*fem, 47*fem),
                child: Text(
                  'Economise ton argent',
                  style: SafeGoogleFont (
                    'Ubuntu',
                    fontSize: 23*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.15*ffem/fem,
                    color: const Color(0xff222121),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 105*fem),
                constraints: BoxConstraints (
                  maxWidth: 308*fem,
                ),
                child: Text(
                  'nous vous donnons la solution à votre problème, ce qui vous fera économiser des sommes importantes. nous comparerons les prix de tous les moyens de transport possibles pour vous rendre à destination et vous proposerons le meilleur choix .',
                  style: SafeGoogleFont (
                    'Ubuntu',
                    fontSize: 14*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.7000000817*ffem/fem,
                    color: const Color(0xff6a6a6a),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                      width: 50*fem,
                      height: 6*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(5.5*fem),
                        color: const Color(0xfff9a826),
                      ),
                    ),
                    Container(
                      // rectangle6Nff (1:5465)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                      width: 23*fem,
                      height: 6*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(5.5*fem),
                        color: const Color(0xfffde5be),
                      ),
                    ),
                    Container(
                      // rectangle7sMX (1:5466)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 131*fem, 0*fem),
                      width: 23*fem,
                      height: 6*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(5.5*fem),
                        color: const Color(0xfffde5be),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Second()),
                        );
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Text(
                        'Next ->',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 14*ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5*ffem/fem,
                          color: const Color(0xfff9a826),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}