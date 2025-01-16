import 'package:demo_dfgc_mobile_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DFGC Connect',
      theme: ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('DFGC Connect'),
          ),
          body: HomeScreen()),
    );
  }
}
