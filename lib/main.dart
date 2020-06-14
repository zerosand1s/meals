import 'package:flutter/material.dart';

import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/bottom_tabs_screen.dart';
import './screens/settings_screen.dart';

import './models/meal.dart';

import './dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;

  Map<String, bool> _filters = {
    'vegan': false,
    'vegetarian': false,
    'glutenFree': false,
    'lactoseFree': false,
  };

  void _setFilters(Map<String, bool> data) {
    setState(() {
      _filters = data;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['glutenFree'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactoseFree'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (context) => BottomTabsScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(
              _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        SettingsScreen.routeName: (context) => SettingsScreen(
              _filters,
              _setFilters,
            ),
      },
    );
  }
}
