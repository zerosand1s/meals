import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  final Map<String, bool> currentFiltes;
  final Function saveFilters;

  SettingsScreen(this.currentFiltes, this.saveFilters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _vegan = false;
  var _vegetarian = false;
  var _glutenFree = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();
    _vegan = widget.currentFiltes['vegan'];
    _vegetarian = widget.currentFiltes['vegetarian'];
    _glutenFree = widget.currentFiltes['glutenFree'];
    _lactoseFree = widget.currentFiltes['lactoseFree'];
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'vegan': _vegan,
                'vegetarian': _vegetarian,
                'glutenFree': _glutenFree,
                'lactoseFree': _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust you meal selections',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile('Vegan', 'Show vegan meals only', _vegan,
                    (newValue) {
                  setState(
                    () {
                      _vegan = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Show vegetarian meals only', _vegetarian,
                    (newValue) {
                  setState(
                    () {
                      _vegetarian = newValue;
                    },
                  );
                }),
                _buildSwitchListTile(
                    'Gluten Free', 'Show gluten free meals only', _glutenFree,
                    (newValue) {
                  setState(
                    () {
                      _glutenFree = newValue;
                    },
                  );
                }),
                _buildSwitchListTile('Lactose Free',
                    'Show lactose free meals only', _lactoseFree, (newValue) {
                  setState(
                    () {
                      _lactoseFree = newValue;
                    },
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
