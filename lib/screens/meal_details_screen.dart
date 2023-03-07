import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/main_drawer.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatefulWidget {
  // Screen Route
  static const routeName = "meal_details";

  const MealDetailsScreen({super.key});

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  String mealId = "";

  @override
  void didChangeDependencies() {
    mealId = ModalRoute.of(context)!.settings.arguments as String;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Getting The Details of The Meal User Chooses
    final selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealId);

    // ======================== Screen Content =============================
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // ==================== Meal Image ====================
                Hero(
                  tag: mealId,
                  child: CircleAvatar(
                    radius: 110,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(selectedMeal.imageUrl),
                      radius: 110,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // ==================== Ingredients Scetion ====================
                buildTitle(context, "Ingredients"),
                buildContainer(
                  context,
                  170,
                  ListView.builder(
                    itemBuilder: (cntx, indx) => ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            Theme.of(context).textTheme.headlineLarge!.color,
                        child: Text(
                          "${(indx + 1)}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        selectedMeal.ingredients[indx],
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    itemCount: selectedMeal.ingredients.length,
                  ),
                ),
                // ==================== Steps Scetion ====================
                buildTitle(context, "Steps"),
                buildContainer(
                  context,
                  250,
                  ListView.builder(
                    itemBuilder: (cntx, indx) => ListTile(
                      contentPadding: const EdgeInsets.all(5),
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundColor:
                            Theme.of(context).textTheme.headlineLarge!.color,
                        child: Text(
                          "${(indx + 1)}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        selectedMeal.steps[indx],
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    itemCount: selectedMeal.steps.length,
                  ),
                ),
              ],
            ),
          ),
        ),

        // ==================== Add This Meal To Fav Meals ====================
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).textTheme.headlineMedium!.color,
          onPressed: () {
            Provider.of<MealProvider>(context, listen: false)
                .toggleFavorites(mealId);
          },
          tooltip: "Add or remove from favorites", // works with a long tap
          splashColor: Theme.of(context).canvasColor,
          child: Icon(
            Provider.of<MealProvider>(context, listen: true).isFavorite(mealId)
                ? Icons.favorite_rounded
                : Icons.favorite_border_rounded,
            color: Colors.black,
            size: 25,
          ),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }

  // ======================== For Containing Ingredients & Steps =============================
  Container buildContainer(BuildContext context, double height, Widget child) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: height,
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).primaryColor,
      ),
      child: child,
    );
  }

// ======================== Making A Title For Each Section =============================
  Text buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
