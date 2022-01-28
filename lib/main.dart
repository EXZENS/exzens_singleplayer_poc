import 'package:exzens_singleplayer_poc/homepage.dart';
import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

void main() {
  Client client = Client();
  client
          .setEndpoint(
              'http://appwrite.exzens.com/v1') // Your Appwrite Endpoint
          .setProject('61f2ef3cd0f1b57ce734') // Your project ID
          .setSelfSigned(
              status:
                  true) // For self signed certificates, only use for development
      ;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
