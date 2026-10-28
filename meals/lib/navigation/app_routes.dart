import 'package:flutter/material.dart';
import 'package:meals/models/filter.dart';
import 'package:meals/navigation/route_arguments.dart';
import 'package:meals/screens/about.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/screens/settings.dart';
import 'package:meals/screens/stats.dart';

class AppRoutes {
  static const home = '/';
  static const meals = '/meals';
  static const mealDetails = '/meal-details';
  static const filters = '/filters';
  static const settings = '/settings';
  static const about = '/about';
  static const stats = '/stats';

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
      case settings:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SettingsScreen(),
        );
      case about:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AboutScreen(),
        );
      case stats:
        final args = settings.arguments as StatsArgs;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => StatsScreen(
            availableMeals: args.availableMeals,
            favoriteMeals: args.favoriteMeals,
          ),
        );
      default:
        return null;
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Page not found')),
        body: Center(child: Text('No screen exists for "${settings.name}".')),
      ),
    );
  }
}
