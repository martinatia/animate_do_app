import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:flutter/material.dart';


import 'package:animate_do_app/src/pages/pagina1_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animate_do',
      home: NavegacionPage()
    );
  }
}