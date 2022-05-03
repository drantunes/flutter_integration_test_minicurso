import 'package:flutter/material.dart';
import 'package:flutter_integration_test_minicurso/pages/home/home_controller.dart';
import 'package:flutter_integration_test_minicurso/widgets/card_counter_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = HomeController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: controller.titulo,
          builder: (context, String titulo, _) => Text(
            titulo,
            key: const Key('titulo'),
          ),
        ),
      ),
      body: FractionallySizedBox(
        widthFactor: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.8,
              child: TextFormField(
                key: const Key('tituloInput'),
                initialValue: controller.titulo.value,
                onChanged: (valor) => controller.titulo.value = valor,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Titulo'),
                ),
              ),
            ),
            CardCounter(
              counter: controller.counter,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => controller.counter.value++,
        label: const Text('Incrementar'),
        icon: const Icon(Icons.plus_one),
      ),
    );
  }
}
