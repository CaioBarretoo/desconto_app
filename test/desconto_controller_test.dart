import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/calculadora.dart';

void main() {
  testWidgets('Calcula desconto corretamente ao clicar no botão', (WidgetTester tester) async {
    await tester.pumpWidget(
       const MaterialApp(home: CalculadoraDesconto()),
    );

    // Digita o preço e o desconto
    await tester.enterText(find.byType(TextField).at(0), '100');
    await tester.enterText(find.byType(TextField).at(1), '10');

    // Clica no botão
    await tester.tap(find.text('Calcular'));
    await tester.pump(); // Rerói a UI

    // Verifica o resultado na tela
    expect(find.text('Preço com desconto: R\$ 90.00'), findsOneWidget);
    expect(find.text('Você economizou: R\$ 10.00'), findsOneWidget);
  });

  testWidgets('Exibe campos de entrada e botão', (WidgetTester tester) async {
    await tester.pumpWidget(
       const MaterialApp(home: CalculadoraDesconto()),
    );

    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Calcular'), findsOneWidget);
  });

  testWidgets('Resultados não aparecem antes do cálculo', (WidgetTester tester) async {
  await tester.pumpWidget( const MaterialApp(home: CalculadoraDesconto()));

  expect(find.textContaining('Preço com desconto:'), findsNothing);
  expect(find.textContaining('Você economizou:'), findsNothing);
});

}
