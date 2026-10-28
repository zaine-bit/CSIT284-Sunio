import 'package:meals/models/meal.dart';


class MealsArgs {
  const MealsArgs({required this.title, required this.meals});
  final String title;
  final List<Meal> meals;
}

class MealDetailsArgs {
  const MealDetailsArgs({required this.meal});
  final Meal meal;
}
