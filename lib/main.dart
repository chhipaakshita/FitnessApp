import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:register/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';
// const String Api_box = "api_data";
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();  //doc.path
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
       home: Welcome(),
      // initialRoute: '/',
      //   onGenerateRoute: RouteGenerator.generateRoute
    );
  }
}


