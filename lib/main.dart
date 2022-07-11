import 'package:first_project_flutter_3_0/screens/form_screen.dart';
import 'package:flutter/material.dart';

import 'screens/Initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter First Project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:  const InitialScreen(),
      home:  const FormScreen(),
    );
  }
}






