import 'package:flutter/material.dart';
import 'package:meal_app/models/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/meal.dart';
import '../dummy_data.dart';

class MealProvider with ChangeNotifier {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };

  List<Meal> avialableMeals = dummyMeals;
  List<Meal> favoritesMeals = [];
  List<Category> avialableCategories = dummyCategories;
  List<String> prefsMealId = [];

  bool isMaleFavorite = false;

// ======================== Add A Meal To Favorite Screen ========================
  void toggleFavorites(String mealId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final existingIndex =
        favoritesMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      favoritesMeals.removeAt(existingIndex);
      prefsMealId.remove(mealId);
    } else {
      favoritesMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      prefsMealId.add(mealId);
    }

    notifyListeners();

    // Saving favorite meals using SharedPreferences
    prefs.setStringList('prefsMealId', prefsMealId);
  }

// ======================== Check If The Meal Is In Favorite Screen ========================
  bool isFavorite(String mealId) {
    return isMaleFavorite = favoritesMeals.any((meal) => meal.id == mealId);
  }

// ======================== Filter Screen Logic ========================
  void setFilters() async {
    avialableMeals = dummyMeals.where((meal) {
      if (filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (filters['vegeterian']! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    // Removing Category If It's Empty After Filtering
    List<Category> avialableCat = [];

    for (var meal in avialableMeals) {
      for (var categoryId in meal.categories) {
        for (var category in dummyCategories) {
          if (category.id == categoryId) {
            if (!avialableCat.any((category) => category.id == categoryId)) {
              avialableCat.add(category);
            }
          }
        }
      }
    }

    avialableCategories = avialableCat;

    notifyListeners();

    // Saving Users's Info
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('gluten', filters['gluten']!);
    pref.setBool('lactose', filters['lactose']!);
    pref.setBool('vegan', filters['vegan']!);
    pref.setBool('vegeterian', filters['vegeterian']!);
  }

// ======================== Getting Users's Info Function ========================
  void getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Updating values of the map filters' keys with stored values in SharedPreferences
    filters['gluten'] = prefs.getBool('gluten') ?? false;
    filters['lactose'] = prefs.getBool('lactose') ?? false;
    filters['vegan'] = prefs.getBool('vegan') ?? false;
    filters['vegeterian'] = prefs.getBool('vegeterian') ?? false;

    prefsMealId = prefs.getStringList('prefsMealId') ?? [];
    for (var mealId in prefsMealId) {
      final existingMeal =
          favoritesMeals.indexWhere((meal) => meal.id == mealId);

      if (existingMeal < 0) {
        favoritesMeals.add(dummyMeals.firstWhere((meal) => meal.id == mealId));
      }
    }

    // removing meals from fav screen after filtering
    List<Meal> fm = [];
    for (var favMeal in favoritesMeals) {
      for (var avMeal in avialableMeals) {
        if (favMeal.id == avMeal.id) fm.add(favMeal);
      }
    }

    favoritesMeals = fm;

    notifyListeners();
  }
}
