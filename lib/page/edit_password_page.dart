import 'package:fen_ghadi/component/password_field.dart';
import 'package:flutter/material.dart';

import '../../component/input_field.dart';
import '../../component/primary_button.dart';
import '../../utilis/style.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../utilss.dart';

class EditPasswordPage extends StatefulWidget {
  const EditPasswordPage({Key? key}) : super(key: key);

  @override
  _EditPasswordPageState createState() => _EditPasswordPageState();
}

class _EditPasswordPageState extends State<EditPasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    // Perform password update logic here using Firebase
    // Example:
    try {
      await FirebaseAuth.instance.currentUser!.updatePassword(_newPasswordController.text);
      // Password update successful
    } catch (e) {
      // Handle password update failure
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color:Colors.black),
        centerTitle: true,
        title: Text(
          'Edit Password',
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Edit your password',
                    style: heading3,
                  ),
                  SizedBox(
                    height: medium,
                  ),
                  PasswordField(
                    hintText: 'Old password',
                    controller: _oldPasswordController,
                  ),
                  SizedBox(
                    height: small,
                  ),
                  PasswordField(
                    hintText: 'New Password',
                    controller: _newPasswordController,
                  ),
                  SizedBox(
                    height: small,
                  ),
                  PasswordField(
                    hintText: 'Re-enter the new password',
                    controller: _confirmPasswordController,
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children:  [
                  Container(
                    child: TextButton(
                      onPressed: () {
                        _submitForm();
                      },
                      style: TextButton.styleFrom (
                        padding: EdgeInsets.zero,
                      ),
                      child: Container(
                        width: 149*fem,
                        height: 40*fem,
                        child: Container(
                          // buttonDqF (I1:3808;1:3142)
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration (
                            color: Color(0xfffbab21),
                            borderRadius: BorderRadius.circular(100*fem),
                          ),
                          child: Center(
                            child: Center(
                              child: Text(
                                'Save',
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
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
