import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({required this.meal, super.key});

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(meal.title),
    );
  }
}
