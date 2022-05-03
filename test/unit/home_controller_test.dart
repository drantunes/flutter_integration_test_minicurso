import 'package:flutter_integration_test_minicurso/pages/home/home_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test HomeController', () {
    test('Contador deve inicializar em 0', () {
      expect(HomeController().counter.value, 0);
    });
    test('Incrementar o contador em 1x', () {
      final controller = HomeController();
      controller.counter.value++;
      expect(controller.counter.value, 1);
    });
    test('Titulo inicial deve ser Home', () {
      expect(HomeController().titulo.value, 'Home');
    });
    test('Alterar o titulo Home para Home Page', () {
      final controller = HomeController();
      controller.titulo.value = 'Home Page';
      expect(controller.titulo.value, 'Home Page');
    });
  });
}
