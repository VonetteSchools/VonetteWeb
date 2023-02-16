import 'package:vonette_web/screens/wrapper/wrapper.dart';
import 'package:vonette_web/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vonette_web/models/user.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDuSVYLq41INBAwIMUF8aQEruwX1LLKp8c",
          authDomain: "vonette-schools-mobile.firebaseapp.com",
          projectId: "vonette-schools-mobile",
          storageBucket: "vonette-schools-mobile.appspot.com",
          messagingSenderId: "1024503668914",
          appId: "1:1024503668914:web:33fa80ec16fe969478a9ab",
          measurementId: "G-YSWQYGHWZL"));
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserInApp?>.value(
        value: AuthService().user,
        initialData: null,
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: Wrapper()));
  }
}
