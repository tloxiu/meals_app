import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({required this.meal, required this.bcgColor, super.key});

  final Meal meal;
  final Color bcgColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 119, 118, 179),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 119, 118, 179),
        foregroundColor: Colors.white,
        title: Text(
          meal.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
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
                  borderRadius: BorderRadius.circular(20),
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
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            for (final ingredient in meal.ingredients)
              Text(
                ingredient,
                style: const TextStyle(
                    color: Colors.white),
              ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Steps:',
              style: TextStyle(
                color: Colors.white,
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
                  style: const TextStyle(color: Colors.white),
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
