import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:fen_ghadi/utilss.dart';

import '../MyApp.dart';

class Third extends StatelessWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // phoneBuo (1:5532)
          padding: EdgeInsets.fromLTRB(24*fem, 20*fem, 12*fem, 13*fem),
          width: double.infinity,
          decoration: const BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // skipEt5 (1:5582)
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
                      color: Color(0xff2f2e41),
                    ),
                  ),
                ),
              ),
              Container(
                // group4J7F (1:5538)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 37.01*fem, 78*fem),
                width: 280.99*fem,
                height: 200*fem,
                child: Image.asset(
                  'lib/images/group-4.png',
                  width: 280.99*fem,
                  height: 200*fem,
                ),
              ),
              Container(
                // commenceryDP (1:5537)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 202*fem, 37*fem),
                child: Text(
                  'Commencer',
                  style: SafeGoogleFont (
                    'Ubuntu',
                    fontSize: 23*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.15*ffem/fem,
                    color: Color(0xff222121),
                  ),
                ),
              ),
              Container(
                // enjoygettingtoyourdestinationw (1:5581)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 190*fem),
                constraints: BoxConstraints (
                  maxWidth: 318*fem,
                ),
                child: Text(
                  'enjoy getting to your destination with less money and efficient way\n',
                  style: SafeGoogleFont (
                    'Ubuntu',
                    fontSize: 14*ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.7000000817*ffem/fem,
                    color: Color(0xff6a6a6a),
                  ),
                ),
              ),
              Container(

                width: double.infinity,
                height: 40*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(0*fem, 17*fem, 172*fem, 17*fem),
                      height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 23*fem,
                            height: 6*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(5.5*fem),
                              color: Color(0xfffde5be),
                            ),
                          ),
                          SizedBox(
                            width: 4*fem,
                          ),
                          Container(
                            // rectangle3y8q (1:5535)
                            width: 23*fem,
                            height: 6*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(5.5*fem),
                              color: Color(0x4cf9a826),
                            ),
                          ),
                          SizedBox(
                            width: 4*fem,
                          ),
                          Container(
                            // rectangle24RB (1:5534)
                            width: 50*fem,
                            height: 6*fem,
                            decoration: BoxDecoration (
                              borderRadius: BorderRadius.circular(5.5*fem),
                              color: Color(0xfff9a826),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
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
                        'Start ',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 18*ffem,
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