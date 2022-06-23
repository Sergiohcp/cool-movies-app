import 'package:coolmovies/widgets/rounded_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget renderRoundedButton(VoidCallback onTap) {
  return MaterialApp(
    title: 'Flutter Demo',
    home: Scaffold(
        appBar: AppBar(
          title: Text("Cool Movies"),
        ),
        body: RoundedButton(
          text: "Enter",
          onTap: onTap,
          width: 200,
        )),
  );
}

void main() {
  group("RoundedButton tests", () {
    testWidgets('show RoundedButton widget and find button text',
        (WidgetTester tester) async {
      final VoidCallback onTap = () => print("tapped");

      await tester.pumpWidget(renderRoundedButton(onTap));

      final buttonTextFinder = find.text(
        "Enter",
      );

      expect(buttonTextFinder, findsOneWidget);
    });
    testWidgets('show RoundedButton widget and tap it',
        (WidgetTester tester) async {
      final VoidCallback onTap = () => print("tapped");

      await tester.pumpWidget(renderRoundedButton(onTap));

      await tester.tap(find.byType(ElevatedButton));
    });
  });
}
