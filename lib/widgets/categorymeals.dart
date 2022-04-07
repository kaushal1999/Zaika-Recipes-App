import 'package:flutter/material.dart';
import 'package:meals/models/dummy-data.dart';
import 'package:meals/models/meal.dart';
import 'meal-item.dart';

class CategoryMeal extends StatefulWidget {
  List<Meal> availableMeals;
  CategoryMeal(this.availableMeals);
  static const routeName = '/category-meal';

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  bool _loadedinit = false;
  List<Meal> categoryMeals = [];
  var categoryTitle;
  @override
  void didChangeDependencies() {
    if (_loadedinit == false) {
      final arg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = arg['title'];

      final categoryId = arg['id'];

      categoryMeals = widget.availableMeals.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      super.didChangeDependencies();

      _loadedinit = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
