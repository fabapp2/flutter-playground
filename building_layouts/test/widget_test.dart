// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:building_layouts/main.dart';

void main() {
  testWidgets('test set of widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());
    verifyDescription();
    verifyTitle();
    verifySubtitle();
    verifyButtons();
    verifyImage();
  });
}

void verifyImage() {
  Finder finder = find.byType(Image);
  expect(finder, findsOneWidget);
  Image imageFound = finder.evaluate().first.widget as Image;
  expect(imageFound.height, 300);
  expect(imageFound.width, 400);
}

void verifyButtons() {
  expect(find.byIcon(Icons.call, skipOffstage: false), findsOneWidget);
  expect(find.byIcon(Icons.near_me, skipOffstage: false), findsOneWidget);
  expect(find.byIcon(Icons.share, skipOffstage: false), findsOneWidget);
}

void verifySubtitle() {
  Finder finder = find.text("Frankfurt am Main, Nordend");
  expect(finder, findsOneWidget);
  Text text = finder.evaluate().last.widget as Text;
  expect(text.style.color, Colors.grey[500]);
}

void verifyTitle() {
  expect(find.text("Fabians home address"), findsOneWidget);
}

void verifyDescription() {
  expect(find.text("""The Nordend is popular for its bohemian mix of restaurants, cafés and bars. In the 1960s and 1970s, the Nordend was one of the centers of the student riots in Germany, along with Hamburg and Berlin. The former German foreign minister's Joschka Fischer political career started here as a student leader for the Green Party. In the 2006 local elections, Fischer's Green Party became the biggest party in the local district assembly, called "Ortsbeirat".
      Up until today, the Nordend has a vibrant mix of artists, working-class people, students, drop-outs, gays and lesbians, and - as of recently - bankers and consultants. The students of the seventies still live here, but they are now best-agers with a high disposable income, which they spend in local wine stores and organic grocery stores. 😂"""), findsOneWidget);
}
