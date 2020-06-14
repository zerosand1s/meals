import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
        appBar: AppBar(
          title: Text('${selectedMeal.title}'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 300,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        '${i + 1}.  ' + selectedMeal.ingredients[i],
                        style: TextStyle(fontSize: 14, letterSpacing: 0.5),
                      ),
                    );
                  },
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              Container(
                height: 200,
                padding: EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                child: ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.only(top: 8),
                      child: Text(
                        '${i + 1}.  ' + selectedMeal.steps[i],
                        style: TextStyle(fontSize: 14, letterSpacing: 0.5),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
