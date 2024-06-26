import 'package:flutter/material.dart';
import 'package:meals_app/components/category_grid_item.dart';
import 'package:meals_app/data/category_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: const Color.fromARGB(255, 44, 49, 79),
          title: const Text(
            'Pick your category',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                children: [
                  for (final category in availableCategories)
                    CategoryGridItem(
                      category: category,
                      imageAsset: category.imageAsset,
                    )
                ],
              ),
            ),
          ],
        ));
  }
}
