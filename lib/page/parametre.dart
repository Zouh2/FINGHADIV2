import 'package:fen_ghadi/MyApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:fen_ghadi/utilss.dart';

class Parametre extends StatefulWidget {
  const Parametre({super.key});

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // setting2Xw (1:3746)
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // autogroupmniz7pH (GQK7Q5sLSh4jTyrRbQMniZ)
                padding: EdgeInsets.fromLTRB(20*fem, 20*fem, 31*fem, 29*fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // autogroupwg45PG1 (GQK6Jx1sLrjHj3L7pxwG45)
                      margin: EdgeInsets.fromLTRB(1*fem, 40*fem, 30*fem, 47*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // backbuttonfzD (1:3749)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 69*fem, 0*fem),
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
                              child: Container(
                                width: 42*fem,
                                height: 42*fem,
                                child: Image.asset(
                                  'assets/images/page-1/images/back-button-6qK.png',
                                  width: 42*fem,
                                  height: 42*fem,
                                ),
                              ),
                            ),
                          ),
                          Center(
                            // paramtreUAy (1:3748)
                            child: Text(
                              'Paramètre',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont (
                                'Ubuntu',
                                fontSize: 20*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1*ffem/fem,
                                letterSpacing: 0.1000000015*fem,
                                color: Color(0xff3f3d56),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      // notificationX9F (1:3750)
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 28*fem),
                        width: double.infinity,
                        child: Text(
                          'Notification',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont (
                            'Ubuntu',
                            fontSize: 16*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.25*ffem/fem,
                            letterSpacing: 0.1000000015*fem,
                            color: Color(0xff232323),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupswvu9Ad (GQK6VXYaP8rz5UP454swvu)
                      margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 4.4*fem, 37*fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // touteslesnotificationsEhs (1:3752)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 124*fem, 0*fem),
                            child: Text(
                              'Toutes les notifications',
                              style: SafeGoogleFont (
                                'Ubuntu',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.4285714286*ffem/fem,
                                letterSpacing: 0.1000000015*fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // frameVNu (1:3753)
                            margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                            width: 28.6*fem,
                            height: 18*fem,
                            child: Image.asset(
                              'assets/images/page-1/images/frame.png',
                              width: 28.6*fem,
                              height: 18*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // motdepasseMg1 (1:3751)
                      margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 20*fem),
                      child: Text(
                        'Mot de passe',
                        style: SafeGoogleFont (
                          'Ubuntu',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.25*ffem/fem,
                          letterSpacing: 0.1000000015*fem,
                          color: Color(0xff232323),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupxry5QeH (GQK6eGo1BKTfNpdp1CXrY5)
                      margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 9*fem),
                      width: 308*fem,
                      height: 238*fem,
                      child: Stack(
                        children: [
                          Positioned(
                            // textfieldt3f (1:3756)
                            left: 0*fem,
                            top: 0*fem,
                            child: Container(
                              width: 308*fem,
                              height: 84*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.only (
                                  topLeft: Radius.circular(4*fem),
                                  topRight: Radius.circular(4*fem),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // textfieldLAZ (I1:3756;52053:24510)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                    width: double.infinity,
                                    height: 64*fem,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0xff79747e)),
                                      borderRadius: BorderRadius.circular(4*fem),
                                    ),
                                    child: Container(
                                      // statelayer11o (I1:3756;52053:24511)
                                      padding: EdgeInsets.fromLTRB(12*fem, 0*fem, 12*fem, 0*fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.only (
                                          topLeft: Radius.circular(4*fem),
                                          topRight: Radius.circular(4*fem),
                                        ),
                                      ),
                                      child: Container(
                                        // contentVBs (I1:3756;52053:24512)
                                        width: 126*fem,
                                        height: 47*fem,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labeltextoTT (I1:3756;52053:24515)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                              width: double.infinity,
                                              height: 16*fem,
                                              decoration: BoxDecoration (
                                                color: Color(0xfffffbfe),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'ancien mot de passe',
                                                  style: SafeGoogleFont (
                                                    'Ubuntu',
                                                    fontSize: 12*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3333333333*ffem/fem,
                                                    letterSpacing: 0.400000006*fem,
                                                    color: Color(0xff1c1b1f),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // inputtextQTF (I1:3756;52053:24514)
                                              margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
                                              child: Text(
                                                '.......\n',
                                                style: SafeGoogleFont (
                                                  'Roboto',
                                                  fontSize: 40*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.5375*ffem/fem,
                                                  letterSpacing: -4*fem,
                                                  color: Color(0xff1c1b1f),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // supportingtext4nh (I1:3756;52053:24519)
                                    margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 0*fem, 0*fem),
                                    child: Text(
                                      'Supporting text',
                                      style: SafeGoogleFont (
                                        'Roboto',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3333333333*ffem/fem,
                                        letterSpacing: 0.400000006*fem,
                                        color: Color(0xff1c1b1f),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // textfieldvpu (1:3757)
                            left: 0*fem,
                            top: 76*fem,
                            child: Container(
                              width: 308*fem,
                              height: 84*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.only (
                                  topLeft: Radius.circular(4*fem),
                                  topRight: Radius.circular(4*fem),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // textfieldmqX (I1:3757;52053:24510)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                    width: double.infinity,
                                    height: 64*fem,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0xff79747e)),
                                      borderRadius: BorderRadius.circular(4*fem),
                                    ),
                                    child: Container(
                                      // statelayer4Zj (I1:3757;52053:24511)
                                      padding: EdgeInsets.fromLTRB(12*fem, 0*fem, 12*fem, 0*fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.only (
                                          topLeft: Radius.circular(4*fem),
                                          topRight: Radius.circular(4*fem),
                                        ),
                                      ),
                                      child: Container(
                                        // contentM33 (I1:3757;52053:24512)
                                        width: 138*fem,
                                        height: 47*fem,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labeltextenq (I1:3757;52053:24515)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                              width: double.infinity,
                                              height: 16*fem,
                                              decoration: BoxDecoration (
                                                color: Color(0xfffffbfe),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'nouveau mot de passe',
                                                  style: SafeGoogleFont (
                                                    'Ubuntu',
                                                    fontSize: 12*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3333333333*ffem/fem,
                                                    letterSpacing: 0.400000006*fem,
                                                    color: Color(0xff1c1b1f),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              // inputtextre1 (I1:3757;52053:24514)
                                              margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
                                              child: Text(
                                                '.......\n',
                                                style: SafeGoogleFont (
                                                  'Roboto',
                                                  fontSize: 40*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.5375*ffem/fem,
                                                  letterSpacing: -4*fem,
                                                  color: Color(0xff1c1b1f),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // supportingtext7K3 (I1:3757;52053:24519)
                                    margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 0*fem, 0*fem),
                                    child: Text(
                                      'Supporting text',
                                      style: SafeGoogleFont (
                                        'Roboto',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3333333333*ffem/fem,
                                        letterSpacing: 0.400000006*fem,
                                        color: Color(0xff1c1b1f),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            // textfieldNVs (1:3758)
                            left: 0*fem,
                            top: 154*fem,
                            child: Container(
                              width: 308*fem,
                              height: 84*fem,
                              decoration: BoxDecoration (
                                borderRadius: BorderRadius.only (
                                  topLeft: Radius.circular(4*fem),
                                  topRight: Radius.circular(4*fem),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // textfield1Yq (I1:3758;52053:24510)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 4*fem),
                                    width: double.infinity,
                                    height: 64*fem,
                                    decoration: BoxDecoration (
                                      border: Border.all(color: Color(0xff79747e)),
                                      borderRadius: BorderRadius.circular(4*fem),
                                    ),
                                    child: Container(
                                      // statelayerVU1 (I1:3758;52053:24511)
                                      padding: EdgeInsets.fromLTRB(12*fem, 0*fem, 12*fem, 0*fem),
                                      width: double.infinity,
                                      height: double.infinity,
                                      decoration: BoxDecoration (
                                        borderRadius: BorderRadius.only (
                                          topLeft: Radius.circular(4*fem),
                                          topRight: Radius.circular(4*fem),
                                        ),
                                      ),
                                      child: Container(
                                        // contentye5 (I1:3758;52053:24512)
                                        width: 162*fem,
                                        height: 47*fem,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              // labeltexthKB (I1:3758;52053:24515)
                                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 9*fem),
                                              width: double.infinity,
                                              height: 16*fem,
                                              decoration: BoxDecoration (
                                                color: Color(0xfffffbfe),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Confirmez le mot de passe',
                                                  style: SafeGoogleFont (
                                                    'Ubuntu',
                                                    fontSize: 12*ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3333333333*ffem/fem,
                                                    letterSpacing: 0.400000006*fem,
                                                    color: Color(0xff1c1b1f),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(

                                              margin: EdgeInsets.fromLTRB(4*fem, 0*fem, 0*fem, 0*fem),
                                              child: Text(
                                                '.......\n',
                                                style: SafeGoogleFont (
                                                  'Roboto',
                                                  fontSize: 40*ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height: 0.5375*ffem/fem,
                                                  letterSpacing: -4*fem,
                                                  color: Color(0xff1c1b1f),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // supportingtextCfF (I1:3758;52053:24519)
                                    margin: EdgeInsets.fromLTRB(16*fem, 0*fem, 0*fem, 0*fem),
                                    child: Text(
                                      'Supporting text',
                                      style: SafeGoogleFont (
                                        'Roboto',
                                        fontSize: 12*ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3333333333*ffem/fem,
                                        letterSpacing: 0.400000006*fem,
                                        color: Color(0xff1c1b1f),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // buttonU6y (I1:3759;1:3142)
                      margin: EdgeInsets.fromLTRB(186*fem, 0*fem, 0*fem, 0*fem),
                      width: 123*fem,
                      height: 40*fem,
                      decoration: BoxDecoration (
                        color: Color(0xfffbab21),
                        borderRadius: BorderRadius.circular(100*fem),
                      ),
                      child: Center(
                        child: Center(
                          child: Text(
                            'Enregistrer',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Ubuntu',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.4285714286*ffem/fem,
                              letterSpacing: 0.1000000015*fem,
                              color: Color(0xffffffff),
                            ),
                          ),
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