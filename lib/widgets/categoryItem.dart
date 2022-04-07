import 'package:flutter/material.dart';
import 'package:meals/widgets/categorymeals.dart';

class CategoryItem extends StatelessWidget {
  final String title;
  final Color color;
  final String categoryId;
  CategoryItem(this.title, this.color, this.categoryId);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryMeal.routeName,
        arguments: {'id': categoryId, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [color.withOpacity(0.7), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      ),
    );
  }
}
