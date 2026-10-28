import 'package:flutter/material.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/navigation/route_arguments.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/screens/meals.dart';

class AppRoutes {
  static const home = '/';
  static const meals = '/meals';
  static const mealDetails = '/meal-details';
  static const filters = '/filters';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case meals:
        final args = settings.arguments as MealsArgs;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MealsScreen(
            title: args.title,
            meals: args.meals,
            onToggleFavorite: args.onToggleFavorite,
            isFavorite: args.isFavorite,
          ),
        );
      case mealDetails:
        final args = settings.arguments as MealDetailsArgs;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => MealDetailsScreen(
            meal: args.meal,
            onToggleFavorite: args.onToggleFavorite,
            isFavorite: args.isFavorite,
          ),
        );
      case filters:
        final currentFilters = settings.arguments as Map<Filter, bool>;
        return MaterialPageRoute<Map<Filter, bool>>(
          settings: settings,
          builder: (_) => FiltersScreen(currentFilters: currentFilters),
        );
      default:
        return null;
    }
  }
}
