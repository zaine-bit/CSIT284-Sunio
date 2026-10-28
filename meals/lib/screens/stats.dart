import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/meal.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({
    super.key,
    required this.availableMeals,
    required this.favoriteMeals,
  });

  final List<Meal> availableMeals;
  final List<Meal> favoriteMeals;

  String get _averageFavoriteDuration {
    if (favoriteMeals.isEmpty) return '-';
    final total = favoriteMeals.fold<int>(0, (sum, meal) => sum + meal.duration);
    return '${(total / favoriteMeals.length).round()} min';
  }

  Widget _statCard(BuildContext context, String value, String label) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Column(
            children: [
              Text(
                value,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counts = [
      for (final category in availableCategories)
        availableMeals.where((meal) => meal.categories.contains(category.id)).length,
    ];
    final maxCount = counts.fold<int>(1, (max, c) => c > max ? c : max);

    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Row(
            children: [
              _statCard(context, '${availableMeals.length}', 'Meals shown'),
              _statCard(context, '${favoriteMeals.length}', 'Favorites'),
              _statCard(context, _averageFavoriteDuration, 'Avg. favorite time'),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Meals per category',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          for (var i = 0; i < availableCategories.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  SizedBox(
                    width: 110,
                    child: Text(
                      availableCategories[i].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Expanded(
                    child: LinearProgressIndicator(
                      value: counts[i] / maxCount,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(5),
                      color: availableCategories[i].color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${counts[i]}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
