import 'package:flutter/material.dart';
import 'screens/my_home_page.dart';

class MyApp extends StatelessWidget {
  final String titleApp;
  const MyApp({Key? key, required this.titleApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: titleApp,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MyHomePage(title: titleApp),
    );
  }
}
