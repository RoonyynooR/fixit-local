import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:localservice/firebase_options.dart';


import 'package:localservice/main_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,

);

  runApp(MainApp());
}
