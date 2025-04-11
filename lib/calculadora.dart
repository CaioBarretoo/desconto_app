import 'package:flutter/material.dart';
import 'desconto_controller.dart';

class CalculadoraDesconto extends StatefulWidget {
  const CalculadoraDesconto({Key? key}) : super(key: key);

  @override
  _CalculadoraDescontoState createState() => _CalculadoraDescontoState();
}

class _CalculadoraDescontoState extends State<CalculadoraDesconto> {
  final controller = DescontoController();

  void _calcular() {
    setState(() {
      controller.calcularDesconto();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora de Desconto',
          style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: controller.precoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Preço original (R\$)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.descontoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Desconto (%)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Calcular',
                style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 32),
            if (controller.precoFinal != null && controller.valorDesconto != null)
              Column(
                children: [
                  Text(
                    'Preço com desconto: R\$ ${controller.precoFinal!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Você economizou: R\$ ${controller.valorDesconto!.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}