import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({required this.onSelectScreen,super.key});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 66, 73, 118),
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 119, 118, 179),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 18,
                ),
                Text(
                  'Cooking up!',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant,
              size: 26,
              color: Colors.white,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            onTap: () {
              onSelectScreen('meals');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              size: 26,
              color: Colors.white,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            onTap: () {
              onSelectScreen('filters');
            },
          )
        ],
      ),
    );
  }
}
