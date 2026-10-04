import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

/// Gradient card with an animated running total and per-category bars.
class SummaryCard extends StatelessWidget {
  const SummaryCard({super.key, required this.expenses});

  final List<Expense> expenses;

  double get _total => expenses.fold(0.0, (sum, e) => sum + e.amount);

  double _totalFor(Category c) =>
      expenses.where((e) => e.category == c).fold(0.0, (s, e) => s + e.amount);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.tertiary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Total spent', style: text.labelLarge?.copyWith(color: scheme.onPrimary)),
          TweenAnimationBuilder<double>(
            tween: Tween(end: _total),
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeOutCubic,
            builder: (_, value, __) => Text(
              '\$${value.toStringAsFixed(2)}',
              style: text.headlineMedium?.copyWith(
                color: scheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          for (final c in Category.values)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Row(
                children: [
                  Icon(categoryIcons[c], size: 18, color: scheme.onPrimary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(end: _total == 0 ? 0 : _totalFor(c) / _total),
                      duration: const Duration(milliseconds: 500),
                      builder: (_, v, __) => LinearProgressIndicator(
                        value: v,
                        minHeight: 6,
                        borderRadius: BorderRadius.circular(3),
                        color: scheme.onPrimary,
                        backgroundColor: scheme.onPrimary.withAlpha(60),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 64,
                    child: Text(
                      '\$${_totalFor(c).toStringAsFixed(0)}',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: scheme.onPrimary),
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
