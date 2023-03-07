import 'package:flutter/material.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

import '../Widgets/main_drawer.dart';
import '../Widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  // Screen Route
  static const String routeName = "categories_meals_screen";

  const CategoryMealsScreen({super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? mealsOfCategory;

  // ======================== Initialize the data of every meal before Building the Screen =============================
  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final List<Meal> avialableMeals =
        Provider.of<MealProvider>(context, listen: true).avialableMeals;

    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title']!;
    mealsOfCategory = avialableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // Landscape Orientation
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    // Getting The Device Screen Width
    var deviceWidth = MediaQuery.of(context).size.width;
    // ======================== Screen Content =============================
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle!,
              style: Theme.of(context).textTheme.titleLarge),
          centerTitle: true,
          backgroundColor: Colors.transparent.withOpacity(0.0),
          toolbarHeight: 70,
          elevation: 9.5,
          scrolledUnderElevation: 8,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                colors: <Color>[
                  const Color.fromARGB(255, 255, 120, 0),
                  const Color(0XFFFFD88B).withOpacity(1),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        // ======================== Displaying the meals of this Category =============================
        body: GridView.builder(
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
              id: mealsOfCategory![index].id,
              imageUrl: mealsOfCategory![index].imageUrl,
              title: mealsOfCategory![index].title,
              duration: mealsOfCategory![index].duration,
              complexity: mealsOfCategory![index].complexity,
              affordability: mealsOfCategory![index].affordability,
            );
          },
          itemCount: mealsOfCategory!.length,
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
