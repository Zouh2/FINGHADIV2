import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fen_ghadi/component/components.dart';
import 'package:fen_ghadi/component/under_part.dart';
import 'package:fen_ghadi/constants.dart';
import 'package:fen_ghadi/widgets/widgets.dart';
import '../aut_services.dart';
import '../component/square_tile.dart';
import '../page/forgetpassword.dart';

class Compte extends StatefulWidget {
  final Function()? onTap;
  const Compte({super.key , required this.onTap});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  final  emailController = TextEditingController();

  final  passwordController = TextEditingController();
  void passer() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const forgetpassword()),
    );
  }


  // sign user in method
  void signUserIn() async {

    showDialog(
      context: context, builder: (context)
    {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop((context));
    }on FirebaseAuthException catch (e) {
      Navigator.pop((context));
      if (e.code == 'user-not-found') {
        print('aucun email coonecter ');
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
                const PageTitleBar(title: 'Login to your account'),
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
                                hintText: 'Username',
                                obscureText: false,
                              ),
                              RoundedPasswordField(
                                controller: passwordController,
                                hintText: 'Password',
                                obscureText: true,
                              ),

                              RoundedButton(text: 'LOGIN', press: () {
                                signUserIn();
                              }
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: widget.onTap,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: passer,
                                child: const Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                      color: kPrimaryColor,
                                      fontFamily: 'OpenSans',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                              ),
                              const SizedBox(height: 20,)
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


iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // google button
      SquareTile(
          onTap: () => AuthService().signInWithGoogle()
          ,
          imagePath: 'lib/images/google.png'
      ),

      SizedBox(width: 5),

    ],
  );
}




