import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal-item.dart';

class Favourites extends StatelessWidget {
  final List<Meal> favourites;
  Favourites(this.favourites);

  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return Center(
        child: Icon(Icons.hourglass_empty),
      );
    } else {
      return ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favourites[index].id,
              title: favourites[index].title,
              complexity: favourites[index].complexity,
              affordability: favourites[index].affordability,
              duration: favourites[index].duration,
              imageUrl: favourites[index].imageUrl,
            );
          },
          itemCount: favourites.length);
    }
  }
}
