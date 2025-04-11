import 'package:flutter/material.dart';

class DescontoController {
  final precoController = TextEditingController();
  final descontoController = TextEditingController();

  double? precoFinal;
  double? valorDesconto;

  void calcularDesconto() {
    final preco = double.tryParse(precoController.text.replaceAll(',', '.'));
    final desconto = double.tryParse(
      descontoController.text.replaceAll(',', '.'),
    );

    if (preco == null || desconto == null) return;

    valorDesconto = preco * (desconto / 100);
    precoFinal = preco - valorDesconto!;
  }

  void dispose() {
    precoController.dispose();
    descontoController.dispose();
  }
}
