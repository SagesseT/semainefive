import 'package:flutter_test/flutter_test.dart';
import 'package:monapplication/main.dart'; 

void main() {
  testWidgets('Affiche la liste des étudiants et le titre',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Liste des étudiants'), findsOneWidget);
    expect(find.text('Calculer la moyenne de la classe'), findsOneWidget);
  });

  testWidgets('Affiche les noms des étudiants dans la liste',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.textContaining('Nom:'), findsWidgets);
  });
}
