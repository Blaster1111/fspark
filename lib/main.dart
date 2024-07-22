import 'package:flutter/material.dart';
import 'package:fspark_task/widgets/custom_navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FSpark',
      debugShowCheckedModeBanner: false,
      home: CustomBottomNavigationBar(),
    );
  }
}
