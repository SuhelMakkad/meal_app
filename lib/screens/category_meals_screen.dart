import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen(this.availabeleMeals, {Key? key}) : super(key: key);

  static const routeName = "/category-meals";

  final List<Meal> availabeleMeals;

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle = "";
  List<Meal> displayedMeals = [];
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final categoryId = routeArgs["id"]!;

      categoryTitle = routeArgs["title"]!;
      displayedMeals = widget.availabeleMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
    }

    _loadedInitData = true;
  }

  void _removeMealItem(String id) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((ctx, index) {
          final categoryMeal = displayedMeals[index];

          return MealItem(
            id: categoryMeal.id,
            title: categoryMeal.title,
            imageUrl: categoryMeal.imageUrl,
            duration: categoryMeal.duration,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
            removeItem: _removeMealItem,
          );
        }),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
