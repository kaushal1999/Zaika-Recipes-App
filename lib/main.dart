import 'package:flutter/material.dart';
import 'package:meals/models/dummy-data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/categorymeals.dart';
import 'package:meals/widgets/filters.dart';
import 'package:meals/widgets/meal-details.dart';
import 'package:meals/widgets/tabs-screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favourites = [];

  void _toggleFav(String id) {
    setState(() {
      final index = _favourites.indexWhere((element) => element.id == id);
      if (index >= 0) {
        _favourites.removeAt(index);
      } else {
        _favourites.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      }
    });
  }

  bool _isFav(String id) {
    if (_favourites.any((element) => element.id == id)) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, bool> _filters = {
    'gluten': false,
    'veg': false,
    'lactose': false,
    'vegan': false
  };

  void _saveFilters(Map<String, bool> selectedFilters) {
    setState(() {
      _filters = selectedFilters;
      _availableMeals = DUMMY_MEALS.where((e) {
        if (_filters['gluten']! && !e.isGlutenFree) {
          return false;
        }
        if (_filters['lactose']! && !e.isLactoseFree) {
          return false;
        }
        if (_filters['veg']! && !e.isVegetarian) {
          return false;
        }
        if (_filters['vegan']! && !e.isVegan) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                title: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed'),
              )),
      routes: {
        '/': (c) => TabsScreen(_favourites),
        CategoryMeal.routeName: (c) => CategoryMeal(_availableMeals),
        MealDetail.routeName: (c) => MealDetail(_toggleFav, _isFav),
        FiltersScreen.routeName: (c) => FiltersScreen(_filters, _saveFilters)
      },
    );
  }
}
