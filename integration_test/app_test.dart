
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:app_of_legends/main.dart' as app;

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('There is a gridview with data', (WidgetTester tester) async {

    app.main();

    await tester.pumpAndSettle();

    expect(
      find.byWidgetPredicate(
            (Widget widget) =>
        widget is GridView &&
            widget.childrenDelegate.estimatedChildCount! > 0,
      ),
      findsOneWidget,
    );

    await tester.scrollUntilVisible(find.byWidgetPredicate((Widget widget) => widget is Text && widget.data == "Zyra"), 100);
  });
}