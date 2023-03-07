import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Getting Fav Meals Using The Provider "MealProvider"
    final List<Meal> favoritesMeals = Provider.of<MealProvider>(
      context,
      listen: true,
    ).favoritesMeals;

    // Landscape Orientation
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Getting The Device Screen Width
    var deviceWidth = MediaQuery.of(context).size.width;

    // In case There Are No Favorite Meals
    if (favoritesMeals.isEmpty) {
      return const SafeArea(
        // ======================== Screen Content =============================
        child: Scaffold(
          body: Center(
            child: Text(
              "You have no favorites yet. Start adding some!",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 110, 0),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    } else {
      // In case There Are Favorite Meals
      return SafeArea(
        // ======================== Screen Content =============================
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          reverse: false,
          primary: true,
          shrinkWrap: true,
          clipBehavior: Clip.hardEdge,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: deviceWidth <= 400 ? 400 : 500,
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            childAspectRatio: isLandscape
                ? deviceWidth / (deviceWidth * 0.83)
                : deviceWidth / (deviceWidth * 0.85),
          ),
          itemBuilder: (ctx, index) {
            return MealItem(
              id: favoritesMeals[index].id,
              imageUrl: favoritesMeals[index].imageUrl,
              title: favoritesMeals[index].title,
              duration: favoritesMeals[index].duration,
              complexity: favoritesMeals[index].complexity,
              affordability: favoritesMeals[index].affordability,
            );
          },
          itemCount: favoritesMeals.length,
        ),
      );
    }
  }
}
