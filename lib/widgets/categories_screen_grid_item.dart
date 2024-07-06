import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/screens/meals_list_screen.dart';

class CategoriesScreenGridItem extends StatelessWidget {
  const CategoriesScreenGridItem(
      {required this.category, required this.imageAsset, required this.onToggleFavourite, required this.availableMeals, super.key});

  final Category category;
  final String imageAsset;
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => MealsListScreen(
                category: category, onToggleFavourite: onToggleFavourite, availableMeals: availableMeals,
              ),
            ),
          );
        },
        splashColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.only(top: 12),
          width: 200,
          height: 130,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                category.color,
                category.color.withOpacity(0.9),
              ],
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Image.asset(
                imageAsset,
                width: 80,
              ),
              const SizedBox(height: 5),
              Text(
                category.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
