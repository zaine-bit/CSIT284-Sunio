import 'package:meals/models/meal.dart';


class MealsArgs {
  const MealsArgs({
    required this.title,
    required this.meals,
    required this.onToggleFavorite,
    required this.isFavorite,
  });
  final String title;
  final List<Meal> meals;
  final void Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) isFavorite;
}

class MealDetailsArgs {
  const MealDetailsArgs({
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
  });
  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) isFavorite;
}

class StatsArgs {
  const StatsArgs({required this.availableMeals, required this.favoriteMeals});
  final List<Meal> availableMeals;
  final List<Meal> favoriteMeals;
}
