
import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';

class loginorregister extends StatefulWidget {
  const loginorregister({Key? key}) : super(key: key);

  @override
  State<loginorregister> createState() => _loginorregisterState();
}

class _loginorregisterState extends State<loginorregister> {

bool showLoginPage = true;
void togglePages(){
  setState(() {
    showLoginPage = !showLoginPage;
  });
}

  @override
  Widget build(BuildContext context) {
  if(showLoginPage){
    return Compte(
      onTap: togglePages,
    );
  }
  else{
    return SignUpScreen(
      onTap: togglePages
    );
  }
  }
}

