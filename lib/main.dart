import 'package:flutter/material.dart';
import 'calculadora.dart';

void main() {
  runApp(const CalculadoraDescontoApp());
}

class CalculadoraDescontoApp extends StatelessWidget {
  const CalculadoraDescontoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculadoraDesconto(),
      debugShowCheckedModeBanner: false,
    );
  }
}
