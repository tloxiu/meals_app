import 'package:flutter/material.dart';
import 'package:meals_app/models/category_model.dart';
import 'package:meals_app/screens/filters_screen.dart';
import 'package:meals_app/widgets/categories_screen_grid_item.dart';
import 'package:meals_app/data/category_data.dart';
import 'package:meals_app/screens/favourites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedIndex = 0;
  final List<Meal> _favouriteMeals = [];
  Map<Filter, bool> selectedFilters = kInitialFilters;

  void showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    setState(() {
      if (_favouriteMeals.contains(meal)) {
        _favouriteMeals.remove(meal);
        showInfoMessage('Meal is no longer a favourite');
      } else {
        _favouriteMeals.add(meal);
        showInfoMessage('Meal added to favourites');
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      final result = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              FiltersScreen(currentFilters: selectedFilters),
        ),
      );
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    }
  }

  List<Widget> _widgetOptions() {
    return [
      CategoriesGridScreen(
        onToggleFavourite: _toggleMealFavouriteStatus,
        favouriteMeals: _favouriteMeals,
        selectedFilters: selectedFilters,
      ),
      FavouritesScreen(
        favouriteMeals: _favouriteMeals,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? 'Pick your category' : 'Your Favourites',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        foregroundColor: const Color.fromARGB(255, 42, 42, 60),
      ),
      drawer: MainDrawer(
        onSelectScreen: setScreen,
      ),
      body: _widgetOptions().elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 119, 118, 179),
        onTap: _onItemTapped,
      ),
    );
  }
}

class CategoriesGridScreen extends StatelessWidget {
  final Function(Meal) onToggleFavourite;
  final List<Meal> favouriteMeals;
  final Map<Filter, bool> selectedFilters;

  const CategoriesGridScreen({
    super.key,
    required this.onToggleFavourite,
    required this.favouriteMeals,
    required this.selectedFilters,
  });

  @override
  Widget build(BuildContext context) {
    final availableMeals = categoriesMeals.where((meal) {
      if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    return Column(
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
                CategoriesScreenGridItem(
                  category: category,
                  imageAsset: category.imageAsset,
                  onToggleFavourite: onToggleFavourite,
                  availableMeals: availableMeals,
                )
            ],
          ),
        ),
      ],
    );
  }
}
