import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:maxmagri/FirebaseData/fetch_data.dart';
import 'package:maxmagri/FirebaseData/send_data.dart';
import 'package:maxmagri/Pages/navpages.dart';
import 'package:maxmagri/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage((_firbaseBackground));
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

@pragma("vm:entry-point")
 Future<void> _firbaseBackground(RemoteMessage message) async{
  await Firebase.initializeApp();
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  FetchData(),
    );
  }
}
