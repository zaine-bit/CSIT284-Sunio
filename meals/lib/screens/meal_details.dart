import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/navigation/app_routes.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({
    super.key,
    required this.meal,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;
  final bool Function(Meal meal) isFavorite;

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite(widget.meal);
  }

  void _toggleFavorite() {
    widget.onToggleFavorite(widget.meal);
    setState(() {
      _isFavorite = widget.isFavorite(widget.meal);
    });
  }

  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: _toggleFavorite,
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0.8, end: 1).animate(animation),
                child: child,
              ),
              child: Icon(
                _isFavorite ? Icons.star : Icons.star_border,
                key: ValueKey(_isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            const SizedBox(height: 24),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 14),
            for (final step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  step,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                Navigator.of(context).popUntil(
                  ModalRoute.withName(AppRoutes.home),
                );
              },
              icon: const Icon(Icons.home),
              label: const Text('Back to categories'),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
