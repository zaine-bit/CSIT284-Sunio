import 'package:meals/models/meal.dart';

String _capitalize(String text) => text[0].toUpperCase() + text.substring(1);

extension ComplexityLabel on Complexity {
  String get label => _capitalize(name);
}

extension AffordabilityLabel on Affordability {
  String get label => _capitalize(name);
}
