import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/models/category_model.dart';

class MealsListScreen extends StatelessWidget {
  const MealsListScreen({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = categoriesMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          category.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.black,
              child: Container(
                height: 100,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      category.color,
                      category.color.withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Transform.scale(
                        scale: 1.2,
                        child: Image.asset(filteredMeals[index].imageAsset),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        filteredMeals[index].title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
