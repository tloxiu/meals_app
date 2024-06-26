import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/models/category_model.dart';

class CategoriesListScreen extends StatelessWidget {
  const CategoriesListScreen({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = categoriesMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (ctx, index) {
          return Center(
            child: Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 100,
                    width: 300,
                    color: category.color,
                    child: Text(
                      filteredMeals[index].title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  child: Image.asset(filteredMeals[index].imageAsset),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
