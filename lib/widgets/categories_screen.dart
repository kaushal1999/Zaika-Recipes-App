import 'package:flutter/material.dart';
import 'package:meals/models/dummy-data.dart';
import 'package:meals/widgets/categoryItem.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(24),
      children: DUMMY_CATEGORIES.map((e) {
        return CategoryItem(e.title, e.color, e.id);
      }).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
    );
  }
}
