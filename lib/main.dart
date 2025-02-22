import 'package:flutter/material.dart';
import 'package:face_analysis_app/pages/welcome_page.dart';

MaterialColor createMaterialColor(Color color) {
  Map<int, Color> colorSwatch = {
    50: Color.fromRGBO(color.red, color.green, color.blue, .1),
    100: Color.fromRGBO(color.red, color.green, color.blue, .2),
    200: Color.fromRGBO(color.red, color.green, color.blue, .3),
    300: Color.fromRGBO(color.red, color.green, color.blue, .4),
    400: Color.fromRGBO(color.red, color.green, color.blue, .5),
    500: color,
    600: Color.fromRGBO(color.red, color.green, color.blue, .7),
    700: Color.fromRGBO(color.red, color.green, color.blue, .8),
    800: Color.fromRGBO(color.red, color.green, color.blue, .9),
    900: Color.fromRGBO(color.red, color.green, color.blue, 1),
  };
  return MaterialColor(color.value, colorSwatch);
}

void main() {
  runApp(const FaceAnalysisApp());
}

class FaceAnalysisApp extends StatelessWidget {
  const FaceAnalysisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Face Analysis App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomePage(),
    );
  }
}
