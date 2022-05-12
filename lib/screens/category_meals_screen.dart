import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  const CategoryMealsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Then Recipes"),
      ),
      body: const Center(
        child: Text("Then Recipes for the Category!"),
      ),
    );
  }
}
