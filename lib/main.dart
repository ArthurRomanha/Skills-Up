import 'package:flutter/material.dart';
import 'package:flutter_test_app/pages/controlador_page.dart';
void main() {
  runApp(const MeuApp());
}

class MeuApp extends StatefulWidget {
  const MeuApp({super.key});

  @override
  State<MeuApp> createState() {
    return _MeuAppState();
  }
}

class _MeuAppState extends State<MeuApp> {

  ThemeMode tema = ThemeMode.light;

  void trocarTema() {
  setState(() {
    tema = tema == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
  });
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppSkillsup',

      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: tema,
     
      home:ControladorPage(
         onToggleTheme: trocarTema,
      )
    );
  }
}