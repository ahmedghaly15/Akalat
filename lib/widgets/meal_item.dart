import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_details_screen.dart';

//============================ Displaying Every Category Meals Info ============================
class MealItem extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  // Getting Complexity Of The Meal
  String get complexityText {
    switch (complexity) {
      case Complexity.simple:
        return "Simple";

      case Complexity.challenging:
        return "Hard";

      case Complexity.hard:
        return "Challenging";

      default:
        return "Unknown";
    }
  }

  // Getting Affordability Of The Meal
  String get affordabilityText {
    switch (affordability) {
      case Affordability.affordable:
        return "Affordable";

      case Affordability.luxurious:
        return "Luxurious";

      case Affordability.pricey:
        return "Pricey";

      default:
        return "Unknown";
    }
  }

  // Going To The Details (Ingredients & Steps) of The Selected Meal
  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () => selectMeal(context),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 20,
            shadowColor: Colors.black,
            margin: const EdgeInsets.all(5.0),
            color: Theme.of(context).canvasColor,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    //=================== Meal Image ===================
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Hero(
                        tag: id,
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                //=================== Meal Name ===================
                Container(
                  padding: const EdgeInsets.all(5),
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headlineLarge,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(Icons.schedule),
                              const SizedBox(width: 5),
                              //=================== Meal Duration ===================
                              Text(
                                "$duration min",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(
                                Icons.work_outline_outlined,
                              ),
                              const SizedBox(width: 5),
                              //=================== Meal Complexity ===================
                              Text(
                                complexityText,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              const Icon(Icons.attach_money_outlined),
                              const SizedBox(width: 1),
                              //=================== Meal Affordability ===================
                              Text(
                                affordabilityText,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
