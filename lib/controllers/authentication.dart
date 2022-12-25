import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dovi_me/controllers/collections/collections.dart';
import 'package:dovi_me/views/pages/log_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../modules/user.dart';
import '../views/pages/home_page.dart';

class AuthService {
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignIn =
          await GoogleSignIn(scopes: ['email']).signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignIn!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      final UserCredential firebaseAuthWithGoogle =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (firebaseAuthWithGoogle.credential != null) {
        // GET FROM FIRESTORE

        final User? user = firebaseAuthWithGoogle.user;
        print(user);
        final userAccount = UserAccount(
          id: user!.uid,
          email: user.email,
          pwd: '',
          username: user.displayName,
          photoUrl: user.photoURL ??
              'https://www.gravatar.com/avatar/69eb72fa6d3f122439c458d6feb37185?s=256&d=identicon&r=PG&f=1',
        );
        Get.put(userAccount);
        users.add({
          'id': user.uid,
          'username': user.displayName,
          'email': user.email,
          'pwd': '',
          'photoUrl': user.photoURL ??
              'https://www.gravatar.com/avatar/69eb72fa6d3f122439c458d6feb37185?s=256&d=identicon&r=PG&f=1'
        });
        Fluttertoast.showToast(
            msg: 'sign in successfully', backgroundColor: Colors.green);

        Get.off(const MyHomePage());
      }
    } catch (e) {
      print(
          'THE ERROR =======================================================:\n${e.toString()} ');
      Fluttertoast.showToast(msg: e.toString(), backgroundColor: Colors.red);
    }
  }

  logOut() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    auth.signOut();
  }

  Widget handleAuthState() {
    final FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data.toString());
          try {
            DocumentSnapshot? user;
            users
                .doc(auth.currentUser!.uid)
                .get()
                .then((value) => user = value);
            print(user.toString());
            Get.put(UserAccount(
              id: user!['id'] ?? '',
              email: user!['email'] ?? '',
              pwd: user!['pwd'] ?? '',
              username: user!['username'] ?? '',
              photoUrl: user!['photoUrl'] ??
                  'https://www.gravatar.com/avatar/69eb72fa6d3f122439c458d6feb37185?s=256&d=identicon&r=PG&f=1',
            ));
          } catch (e) {
            print(e.toString());
            Fluttertoast.showToast(
              msg: e.toString(),
              backgroundColor: Colors.red,
            );
          }

          return const MyHomePage();
        } else {
          return const LogIn();
        }
      },
    );
  }
}
