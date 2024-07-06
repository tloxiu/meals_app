import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({required this.currentFilters,super.key});

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFreeFilterSet = false;
  var lactoseFreeFilterSet = false;
  var vegetarianFilterSet = false;
  var veganFilterSet = false;

  @override
  void initState() {
    super.initState();
    glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    vegetarianFilterSet = widget.currentFilters[Filter.vegetarian]!;
    veganFilterSet = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your filters',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: glutenFreeFilterSet,
            Filter.lactoseFree: lactoseFreeFilterSet,
            Filter.vegetarian: vegetarianFilterSet,
            Filter.vegan: veganFilterSet,
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeFilterSet = isChecked;
                });
              },
              title: const Text('Gluten-free'),
              subtitle: const Text('Only include gluten-free meals'),
              activeColor: const Color.fromARGB(255, 119, 118, 179),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFreeFilterSet = isChecked;
                });
              },
              title: const Text('Lactose-free'),
              subtitle: const Text('Only include lactose-free meals'),
              activeColor: const Color.fromARGB(255, 119, 118, 179),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  vegetarianFilterSet = isChecked;
                });
              },
              title: const Text('Vegeratian'),
              subtitle: const Text('Only include vegetarian meals'),
              activeColor: const Color.fromARGB(255, 119, 118, 179),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: veganFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  veganFilterSet = isChecked;
                });
              },
              title: const Text('Vegan'),
              subtitle: const Text('Only include vegan meals'),
              activeColor: const Color.fromARGB(255, 119, 118, 179),
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}
