
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fen_ghadi/page/aboutus.dart';
import 'package:fen_ghadi/page/contacter_nous.dart';
import 'package:fen_ghadi/page/parametre.dart';
import 'package:fen_ghadi/page/positions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../utilss.dart';
import 'aut_page.dart';
import 'edit_password_page.dart';
import 'menuprofile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Future<void> _handleLogout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const AuthPage()), (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          title:  Text(
            'mon compte',
            style: SafeGoogleFont (
              'Ubuntu',
              fontSize: 18*ffem,
              fontWeight: FontWeight.w400,
              height: 1.7000000817*ffem/fem,
              color: const Color(0xFF3F3D56),
            ),
          ),
          centerTitle: true,
          leading: SizedBox(), // removes the back button
          backgroundColor: Colors.white,
            elevation: 0// sets the background color to blue
        ),
        body: SingleChildScrollView(
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        menuprofileWidget(
                          title: "votre position",
                          icon: LineAwesomeIcons.marker,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  Position()),
                            );
                          },
                        ),
                        menuprofileWidget(
                          title: "paramétre",
                          icon: LineAwesomeIcons.cog,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EditPasswordPage()),
                            );
                          },
                        ),
                        menuprofileWidget(
                          title: "a propos de nous",
                          icon: LineAwesomeIcons.info,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const About()),
                            );
                          },
                        ),
                        menuprofileWidget(
                          title: "nous contacter",
                          icon: LineAwesomeIcons.phone,
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  ContactUsPage()),
                            );
                          },
                        ),
                        const Divider(),
                        const SizedBox(height: 20),
                        menuprofileWidget(
                          title: "Se déconnecter",
                          icon: LineAwesomeIcons.alternate_sign_out,
                          textColor: Colors.red,
                          endIcon: false,
                          onPress: () => _handleLogout(context),
                        ),
                      ],
                    )
                ),

              ),

        )
    );
  }
}
