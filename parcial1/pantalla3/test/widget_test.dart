// Prueba básica de humo para la Pantalla 3 (Perfil).
//
// Verifica que la app carga y que se muestran los textos principales
// de la pantalla de perfil.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pantalla3/main.dart';

void main() {
  testWidgets('La pantalla de Perfil muestra los datos principales', (
    WidgetTester tester,
  ) async {
    // Construye la app y dispara un frame.
    await tester.pumpWidget(const MyApp());

    // Verifica el título de la pantalla.
    expect(find.text('Profile'), findsOneWidget);

    // Verifica que las secciones principales estén presentes.
    expect(find.text('Personal info'), findsOneWidget);
    expect(find.text('Account info'), findsOneWidget);

    // Verifica un dato de ejemplo dentro de "Personal info".
    expect(find.text('Terry Melton'), findsOneWidget);
  });
}
