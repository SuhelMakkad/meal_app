import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen(this.meals, {Key? key}) : super(key: key);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    if (meals.isEmpty) {
      return const Center(
        child: Text("You have no favorites yet - start adding some!"),
      );
    }

    return ListView.builder(
      itemBuilder: ((ctx, index) {
        final meal = meals[index];

        return MealItem(
          id: meal.id,
          title: meal.title,
          imageUrl: meal.imageUrl,
          duration: meal.duration,
          complexity: meal.complexity,
          affordability: meal.affordability,
        );
      }),
      itemCount: meals.length,
    );
  }
}
