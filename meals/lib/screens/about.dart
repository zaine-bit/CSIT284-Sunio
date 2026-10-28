import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  Widget _feature(BuildContext context, IconData icon, String title, String text) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(title),
      subtitle: Text(text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Icon(
            Icons.fastfood,
            size: 72,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 12),
          Text(
            'Cooking Up!',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 4),
          Text(
            'Version 1.0.0',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 20),
          Text(
            'A Flutter meals app built for CSIT284, Topic 8: Navigation. '
            'Browse meal categories, open recipes, save favorites and filter meals by diet.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const SizedBox(height: 24),
          Card(
            child: Column(
              children: [
                _feature(context, Icons.alt_route, 'Named routes',
                    'Every screen is opened by name from one routes file.'),
                _feature(context, Icons.send, 'Route arguments',
                    'Meals, filters and favorites travel to the next screen.'),
                _feature(context, Icons.undo, 'Returning data',
                    'The filters screen sends its choices back on pop.'),
                _feature(context, Icons.tab, 'Tabs and drawer',
                    'Bottom tabs and a side menu move between sections.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
