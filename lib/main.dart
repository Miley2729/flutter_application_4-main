import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/centro_educativo_controller.dart';
import 'listar.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CentroEducativoController(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CentroEducativoPage(),
    );
  }
}
