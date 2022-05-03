import 'package:flutter/material.dart';
import 'package:flutter_integration_test_minicurso/app.dart';
import 'package:flutter_integration_test_minicurso/pages/home/home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Increment Counter on HomePage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.tap(find.byIcon(Icons.plus_one));
    await tester.pump();

    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('Change Title on HomePage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const App());

    var titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;

    expect(find.byType(HomePage), findsOneWidget);
    expect(titulo.data, equals('Home'));

    await tester.enterText(find.byKey(const Key('tituloInput')), 'Home Page');
    await tester.pumpAndSettle();

    titulo = find.byKey(const Key('titulo')).evaluate().single.widget as Text;
    expect(titulo.data, equals("Home Page"));
  });
}
