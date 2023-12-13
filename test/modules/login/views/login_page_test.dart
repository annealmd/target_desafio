import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:target_test/modules/login/views/login_page.dart';
import 'package:target_test/modules/login/views/widgets/widgets.dart';

void main() {

   testWidgets('Find the keys', (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // 2. Find widgets with keys
      final scrollViewKey = find.byKey(const Key('SCSV_LoginPage'));
      final columnKey = find.byKey(const Key('Column_LoginPage'));
      final buttonKey = find.byKey(const Key('Button_LoginPage'));

      // 3. Verify that the widgets with keys are present
     
      expect(scrollViewKey, findsOneWidget);
      expect(columnKey, findsOneWidget);
      expect(buttonKey, findsOneWidget);
    });
  

  group('UserWidget Test', () {
     testWidgets('Find UserWidget',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      final userWidgetKey = find.byType(UserWidget);
       expect(userWidgetKey, findsOneWidget);
    });
   

    testWidgets('INVALID: Input empty',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));      

      // 2. Interaction testing (form validation)
      // Assume the initial state has invalid inputs
      // Empty password
      await tester.enterText(find.byType(UserWidget), '');

      await tester.tap(find.byKey(const Key('Button_LoginPage')));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // validation
      final userErrorFinder = find.text('Informe um nome de usuário');
      expect(userErrorFinder, findsOneWidget);

      // Verify that the snackbar is shown due to form validation
      expect(find.text('Preencha os campos corretamente.'), findsOneWidget);
    });

     testWidgets('INVALID: Value length > 21',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));      

      // 2. Interaction testing (form validation)
      // Assume the initial state has invalid inputs
      // Empty password
      await tester.enterText(find.byType(UserWidget), '123456789101112131415161718192021');

      await tester.tap(find.byKey(const Key('Button_LoginPage')));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // validation
      final userErrorFinder = find.text('Deve ter no máximo 20 caracteres');
      expect(userErrorFinder, findsOneWidget);

      // Verify that the snackbar is shown due to form validation
      expect(find.text('Preencha os campos corretamente.'), findsOneWidget);
    });

     testWidgets('INVALID: Empty space at the end',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));      

      // 2. Interaction testing (form validation)
      // Assume the initial state has invalid inputs
      // Empty password
      await tester.enterText(find.byType(UserWidget), 'Test1 ');

      await tester.tap(find.byKey(const Key('Button_LoginPage')));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // validation
      final userErrorFinder = find.text('Não deve conter espaço em branco no final.');
      expect(userErrorFinder, findsOneWidget);

      // Verify that the snackbar is shown due to form validation
      expect(find.text('Preencha os campos corretamente.'), findsOneWidget);
    });
  });

  group('PasswordWidget Test', () {
     testWidgets('Find PasswordWidget',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      final passwordWidgetKey = find.byType(PasswordWidget);
       expect(passwordWidgetKey, findsOneWidget);
    });
   

    testWidgets('INVALID: Input empty',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));      

      // 2. Interaction testing (form validation)
      // Assume the initial state has invalid inputs
      // Empty password
      await tester.enterText(find.byType(UserWidget), 'Test1');
      await tester.enterText(find.byType(PasswordWidget), '');

      await tester.tap(find.byKey(const Key('Button_LoginPage')));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // validation
      final passwordErrorFinder = find.text('Deve ter no mínimo 2 caracteres');
      expect(passwordErrorFinder, findsOneWidget);

      // Verify that the snackbar is shown due to form validation
      expect(find.text('Preencha os campos corretamente.'), findsOneWidget);
    });

     testWidgets('INVALID: Value length > 21',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));      

      // 2. Interaction testing (form validation)
      // Assume the initial state has invalid inputs
      await tester.enterText(find.byType(UserWidget), 'Test1');
      await tester.enterText(find.byType(PasswordWidget), '123456789101112131415161718192021');

      await tester.tap(find.byKey(const Key('Button_LoginPage')));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // validation
      final passwordErrorFinder = find.text('Deve ter no máximo 20 caracteres');
      expect(passwordErrorFinder, findsOneWidget);

      // Verify that the snackbar is shown due to form validation
      expect(find.text('Preencha os campos corretamente.'), findsOneWidget);
    });

     testWidgets('INVALID: accept just letters and numbers',
        (WidgetTester tester) async {
      // 1. Build the widget tree
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));      

      // 2. Interaction testing (form validation)
      // Assume the initial state has invalid inputs
      // Empty password
      await tester.enterText(find.byType(UserWidget), 'Test1');
      await tester.enterText(find.byType(PasswordWidget), 'tesT*');

      await tester.tap(find.byKey(const Key('Button_LoginPage')));
      await tester.pumpAndSettle(); // Wait for animations to complete

      // validation
      final passwordErrorFinder = find.text('Deve conter apenas letras e números');
      expect(passwordErrorFinder, findsOneWidget);

      // Verify that the snackbar is shown due to form validation
      expect(find.text('Preencha os campos corretamente.'), findsOneWidget);
    });



  });
}
