import 'package:flutter/material.dart';

class Category {
  const Category(
      {required this.backgroundColor, required this.id, required this.title, this.color = Colors.orange, required this.imageAsset});

  final String id;
  final String title;
  final Color color;
  final String imageAsset;
  final Color backgroundColor;
}



enum Complexity {
  simple,
  tough,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageAsset,
    required this.realMealAsset,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.isVegetarian,
  });

  final String id;
  final List<String> categories;
  final String title;
  final String imageAsset;
  final String realMealAsset;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
}
