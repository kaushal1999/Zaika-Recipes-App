import 'package:flutter/material.dart';
import 'package:meals/models/dummy-data.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFav;
  final Function isFav;

  MealDetail(this.toggleFav, this.isFav);

  Widget titleBuilder(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(6),
      height: 200,
      width: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
          color: Colors.white),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == arg);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            titleBuilder('Ingredients', context),
            buildContainer(
              ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(meal.ingredients[index]),
                      ),
                    );
                  }),
            ),
            titleBuilder('Steps', context),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                        title: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(meal.steps[index]),
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Text('#${index + 1}'),
                        )),
                    Divider(
                      color: Colors.grey,
                    )
                  ],
                );
              },
              itemCount: meal.steps.length,
            )),
            SizedBox(
              height: 6,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            toggleFav(meal.id);
          },
          child: isFav(meal.id) ? Icon(Icons.star) : Icon(Icons.star_border)),
    );
  }
}
