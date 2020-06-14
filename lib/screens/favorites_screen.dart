import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../models/meal.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorite meals yet, start adding!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, i) {
          return MealItem(
            id: favoriteMeals[i].id,
            title: favoriteMeals[i].title,
            imageUrl: favoriteMeals[i].imageUrl,
            duration: favoriteMeals[i].duration,
            complexity: favoriteMeals[i].complexity,
            affordability: favoriteMeals[i].affordability,
          );
        },
      );
    }
  }
}
