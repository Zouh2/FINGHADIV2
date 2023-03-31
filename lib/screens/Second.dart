import 'package:fen_ghadi/screens/Third.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:fen_ghadi/utilss.dart';

import '../MyApp.dart';

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Container(
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
                  // group2Q1K (1:5502)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 78*fem),
                  width: 260*fem,
                  height: 200*fem,
                  child: Image.asset(
                    'lib/images/group-2.png',
                    width: 260*fem,
                    height: 200*fem,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 133*fem, 37*fem),
                  child: Text(
                    'Gagnez du temps',
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
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 6*fem, 152*fem),
                  constraints: BoxConstraints (
                    maxWidth: 315*fem,
                  ),
                  child: Text(
                    'Passez moins de temps sur les transports avec nous, en connaissant tous les détails sur les gares à proximité ainsi que le mode de transport qui vous y conduira le plus rapidement.\n',
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
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 13*fem, 0*fem),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 4*fem, 0*fem),
                        width: 23*fem,
                        height: 6*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(5.5*fem),
                          color: const Color(0xfffde5be),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 4*fem, 0*fem),
                        width: 50*fem,
                        height: 6*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(5.5*fem),
                          color: const Color(0xfff9a826),
                        ),
                      ),
                      Container(

                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 121*fem, 0*fem),
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
                            MaterialPageRoute(builder: (context) => const Third()),
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
      ),
    );
  }
}