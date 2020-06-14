import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

import '../widgets/main_drawer.dart';

import '../models/meal.dart';

class BottomTabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  BottomTabsScreen(this.favoriteMeals);

  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  List<Map<String, Object>> _screens;
  int _selectedScreenIndex = 0;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'screen': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorites',
      }
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screens[_selectedScreenIndex]['title'],
          style: TextStyle(
            fontSize: 24,
            letterSpacing: 1,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          )
        ],
        onTap: _selectScreen,
      ),
    );
  }
}
