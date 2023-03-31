import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../utilss.dart';
import '../widgets/rounded_button.dart';
import '../widgets/rounded_input_field.dart';
class forgetpassword extends StatefulWidget {
  const forgetpassword({Key? key}) : super(key: key);

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  final emailController = TextEditingController();

  void  Password() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Password Reset'),
          content: Text('chek your email pour reset email'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void forget() async {
  var forgetemail = emailController.text.trim();
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: forgetemail).then((value) => {Password()
  });
  } on FirebaseAuthException catch(e){
    print("error $e");
  }
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Reset Email',
          style: SafeGoogleFont (
            'Ubuntu',
            fontSize: 18*ffem,
            fontWeight: FontWeight.w400,
            height: 1.7000000817*ffem/fem,
            color: const Color(0xFF3F3D56),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // sets the background color to blue

      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // logo
                Image.asset(
                  'lib/images/logo.png',
                  width: 150,
                  height: 150,
                ),

                const SizedBox(height: 20),

                // welcome back, you've been missed!
                Text(
                  'Welcome back you\'forget your paswword!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                RoundedInputField(
                  icon: Icons.email,
                  controller: emailController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // password textfield

                const SizedBox(height: 10),

                // forgot password?


                const SizedBox(height: 20),

                // sign in button
                RoundedButton(text: 'Send email', press: () {}
                ),

                const SizedBox(height: 20),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
