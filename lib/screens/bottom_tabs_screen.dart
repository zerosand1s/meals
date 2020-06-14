import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

class BottomTabsScreen extends StatefulWidget {
  @override
  _BottomTabsScreenState createState() => _BottomTabsScreenState();
}

class _BottomTabsScreenState extends State<BottomTabsScreen> {
  final List<Map<String, Object>> _screens = [
    {
      'screen': CategoriesScreen(),
      'title': 'Categories',
    },
    {
      'screen': FavoritesScreen(),
      'title': 'Your Favorites',
    }
  ];

  int _selectedScreenIndex = 0;

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
