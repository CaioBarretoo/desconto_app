import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/desconto_controller.dart';

void main() {
  group('DescontoController', () {
    late DescontoController controller;

    setUp(() {
      controller = DescontoController();
    });

    tearDown(() {
      controller.dispose();
    });

    test('Cálculo correto do desconto', () {
      controller.precoController.text = '200';
      controller.descontoController.text = '25';

      controller.calcularDesconto();

      expect(controller.valorDesconto, 50.0);
      expect(controller.precoFinal, 150.0);
    });

    test('Desconto zero retorna o mesmo valor', () {
      controller.precoController.text = '150';
      controller.descontoController.text = '0';

      controller.calcularDesconto();

      expect(controller.valorDesconto, 0.0);
      expect(controller.precoFinal, 150.0);
    });

    test('Desconto de 100% retorna zero', () {
      controller.precoController.text = '150';
      controller.descontoController.text = '100';

      controller.calcularDesconto();

      expect(controller.valorDesconto, 150.0);
      expect(controller.precoFinal, 0.0);
    });

    test('Campos vazios não alteram valores calculados', () {
      controller.precoController.text = '';
      controller.descontoController.text = '';

      controller.calcularDesconto();

      expect(controller.valorDesconto, isNull);
      expect(controller.precoFinal, isNull);
    });


    test('Não calcula se os valores forem inválidos', () {
      controller.precoController.text = 'abc';
      controller.descontoController.text = '10';

      controller.calcularDesconto();

      expect(controller.valorDesconto, isNull);
      expect(controller.precoFinal, isNull);
    });
  });
}
