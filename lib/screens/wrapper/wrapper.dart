import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vonette_web/models/user.dart';
import 'package:vonette_web/screens/authernticate/loginPage.dart';
import 'package:vonette_web/screens/home/main/main_screen.dart';
import 'package:vonette_web/services/database.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  // return either home or authenticate widget
  // looks for the state of auth stream (null or obj)

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserInApp?>(context);
    if (user == null) {
      return const LoginPage();
    } else {
      return StreamProvider<QuerySnapshot?>.value(
        initialData: null,
        value: DatabaseService(user: user).updateUserStream,
        child: MainScreen());
    }
  }
}
