import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal-details.dart';

class MealItem extends StatelessWidget {
  final String title;
  final Complexity complexity;
  final Affordability affordability;
  final String imageUrl;
  final int duration;
  final String id;
  MealItem({
    required this.affordability,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.title,
    required this.id,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetail.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectMeal(context),
        child: Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(children: [
              Stack(children: [
                ClipRRect(
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 300,
                      color: Colors.black54,
                      child: Text(title,
                          softWrap: true,
                          style: TextStyle(color: Colors.white, fontSize: 26)),
                    )),
              ]),
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 50,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.schedule),
                          SizedBox(
                            width: 4,
                          ),
                          Text('$duration min')
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.work),
                          SizedBox(
                            width: 4,
                          ),
                          Text(complexityText)
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.attach_money),
                          SizedBox(
                            width: 4,
                          ),
                          Text(affordabilityText)
                        ],
                      ),
                    ]),
              )
            ])));
  }
}
