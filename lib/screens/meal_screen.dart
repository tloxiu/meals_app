import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class MealScreen extends StatelessWidget {
  const MealScreen(
      {required this.meal, required this.onToggleFavourite, super.key});

  final Meal meal;
  final void Function(Meal meal) onToggleFavourite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          meal.title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {
                  onToggleFavourite(meal);
                },
                icon: const Icon(Icons.star)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Image.asset(
                    meal.realMealAsset,
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Text(
              'Ingredients:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            for (final ingredient in meal.ingredients)
              Text(
                  textAlign: TextAlign.center,
                  ingredient,
                  style: const TextStyle(fontSize: 15)),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Steps:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            for (final step in meal.steps)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  step,
                  style: const TextStyle(fontSize: 15),
                ),
              ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
