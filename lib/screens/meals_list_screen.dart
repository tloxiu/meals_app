import 'package:flutter/material.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/screens/meal_screen.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class MealsListScreen extends StatelessWidget {
  const MealsListScreen({required this.category, super.key});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final filteredMeals = categoriesMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      backgroundColor: category.backgroundColor,
      appBar: AppBar(
        backgroundColor: category.backgroundColor,
        foregroundColor: Colors.white,
        title: Text(
          category.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: InkWell(
              onTap: () {
                final tappedMeal = filteredMeals[index];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        MealScreen(meal: tappedMeal),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.black,
              child: Container(
                height: 170,
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 16,
                  bottom: 16,
                  left: 16,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      category.color,
                      category.color.withOpacity(0.9),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          child: Transform.scale(
                            scale: 1.2,
                            child: Image.asset(filteredMeals[index].imageAsset),
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          flex: 2,
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
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${filteredMeals[index].duration} min',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.work,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              filteredMeals[index]
                                  .affordability
                                  .toString()
                                  .split('.')
                                  .last
                                  .capitalize(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.arrow_outward,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              filteredMeals[index]
                                  .complexity
                                  .toString()
                                  .split('.')
                                  .last
                                  .capitalize(),
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        )
                      ],
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
