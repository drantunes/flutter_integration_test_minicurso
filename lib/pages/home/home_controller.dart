import 'package:flutter/foundation.dart';

class HomeController {
  final ValueNotifier<int> counter = ValueNotifier<int>(0);
  final ValueNotifier<String> titulo = ValueNotifier<String>('Home');
}
