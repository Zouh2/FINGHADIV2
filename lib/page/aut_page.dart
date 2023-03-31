import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../MyApp.dart';
import 'Profile_Page.dart';
import 'login_or_register.dart';



 /*decideRoute(){
   User? user = FirebaseAuth.instance.currentUser;
   if(user  !=null){
     FirebaseFirestore.instance.collection('users').doc(user.uid).get()
         .then((value){
       if(value.exists){
         Get.to(() => HomePage());
       }
       else{
         Get.to(() => loginorregister());
       }
     });
   }

   return Scaffold(
  body: FutureBuilder<DataSnapshot>(
    future: FirebaseDatabase.instance.reference().child('users').child(FirebaseAuth.instance.currentUser!.uid).once(),
    builder: (BuildContext context, AsyncSnapshot<DataSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      }

      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      }

      if (snapshot.data != null && snapshot.data!.value != null) {
        return HomePage();
      } else {
        return loginorregister();
      }
    },
  ),
);

 }*/

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const ProfilePage();
                    }
          else {

            return const loginorregister();
          }


        },
      ),
    );
  }
}
