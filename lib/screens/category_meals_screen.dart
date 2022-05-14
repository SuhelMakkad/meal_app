import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../data/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  static const routeName = "/category-meals";

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    final categoryTitle = routeArgs["title"]!;
    final categoryId = routeArgs["id"]!;

    final categoryMeals = dummyMeals
        .where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          final categoryMeal = categoryMeals[index];

          return MealItem(
            id: categoryMeal.id,
            title: categoryMeal.title,
            imageUrl: categoryMeal.imageUrl,
            duration: categoryMeal.duration,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
          );
        }),
        itemCount: categoryMeals.length,
      ),
    );
  }
}
