import 'package:flutter/material.dart';
import 'package:indicium/utils/create_schemas.dart';

import 'home_page.dart';
import 'onboarding_page.dart';

import 'package:motor_flutter/motor_flutter.dart';

// Modify the main method to be Future<void>
Future<void> main() async {
  // Init method sets up State Management with GetX and ensures that Widgets are
  // rendered before the Motor Node is ready.
  //await MotorFlutter.init();
  //  broadcastInitialArtistSchemaDefinition();
  // broadcastInitialCollectibleSchemaDefinition();
  // Start your App like normal
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const OnboardingPage(),
        routes: {
          HomePage.routeName: (ctx) => const HomePage(),
        });
  }
}
