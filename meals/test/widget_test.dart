import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:meals/navigation/app_routes.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/tabs.dart';

void main() {

  testWidgets('Tapping a category opens its meals screen', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CategoriesScreen(
          availableMeals: const [],
          onToggleFavorite: (_) {},
          isFavorite: (_) => false,
        ),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );

    await tester.tap(find.text('Italian'));
    await tester.pumpAndSettle();

    expect(find.widgetWithText(AppBar, 'Italian'), findsOneWidget);
    expect(find.text('Uh oh ... nothing here!'), findsOneWidget);
  });

  testWidgets('Drawer opens the statistics screen', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const TabsScreen(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Statistics'));
    await tester.pumpAndSettle();

    expect(find.text('Meals per category'), findsOneWidget);
  });
}
