import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  const FavouritesScreen({
    super.key,
    required this.favouriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favouriteMeals.isEmpty
          ? const Center(
              child: Text(
                'Your favourite meals will be displayed here.',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: favouriteMeals.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(favouriteMeals[index].title),
                );
              },
            ),
    );
  }
}
