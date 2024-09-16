import 'package:body_mass_index_project/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApplication());
}

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()
    );
  }
}