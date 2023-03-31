import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fen_ghadi/component/components.dart';
import 'package:fen_ghadi/component/under_part.dart';
import 'package:fen_ghadi/constants.dart';
import 'package:fen_ghadi/screens/screens.dart';
import 'package:fen_ghadi/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  final Function()? onTap;
  const SignUpScreen({super.key , required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmpasswordController = TextEditingController();
  void signUserup() async {

    showDialog(
      context: context, builder: (context)
    {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    );
    try {
      if(passwordController.text == confirmpasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      }
      else{
        Navigator.pop(context);
        ErrorMessage();
      }
    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-found') {
        print(' email deja un compte');
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        print('mot de passe incorrecte');
        wrongPasswordMessage();
      }
    }
  }

  void  wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mot de passe incorrect'),
          content: Text('Le mot de passe que vous avez saisi est incorrect.'),
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
  void  wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          title: Text('email incorrect'),
          content: Text('email que vous avez saisi est incorrect.'),
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
  void  ErrorMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
          title: Text('password not match'),
          content: Text('poswword que vous avez saisi est incorrect avec la premier password.'),
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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "lib/images/logo.png",
                ),
                const PageTitleBar(title: 'Create New Account'),
                Padding(
                  padding: const EdgeInsets.only(top: 320.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        iconButton(context),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: 'OpenSans',
                              fontSize: 13,
                              fontWeight: FontWeight.w600),
                        ),
                        Form(
                          child: Column(
                            children: [
                              RoundedInputField(
                                icon: Icons.email,
                                controller: emailController,
                                hintText: 'email',
                                obscureText: false,
                              ),
                            RoundedPasswordField(
                              controller: passwordController,
                              hintText: 'Password',
                              obscureText: true,
                            ),
                              RoundedPasswordField(
                                controller: confirmpasswordController,
                                hintText: 'Confirmer password ',
                                obscureText: true,
                              ),
                              RoundedButton(text: 'REGISTER', press: () {
                                signUserup();
                              }),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: widget.onTap
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
