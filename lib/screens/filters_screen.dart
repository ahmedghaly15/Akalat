import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  Widget build(BuildContext context) {
    // Getting Filters The User Chose Using Provider "MealProvider"
    final Map<String, bool> currentFilters =
        Provider.of<MealProvider>(context, listen: true).filters;

    // ======================== Screen Content =============================
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Filters", style: Theme.of(context).textTheme.titleLarge),
          centerTitle: true,
          elevation: 9.5,
          scrolledUnderElevation: 8,
          toolbarHeight: 70,
          backgroundColor: Colors.transparent.withOpacity(0.0),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 255, 120, 0),
                  const Color(0XFFFFD88B).withOpacity(1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 15),
              padding: const EdgeInsets.all(5),
              child: const Text(
                "Adjust your meal selection",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 110, 0),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  // Filter No Gluten Meals
                  buildSwitchListTile(
                    context,
                    "No Gluten",
                    "gluten-free",
                    currentFilters['gluten']!,
                    (newVal) {
                      setState(() {
                        currentFilters['gluten'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  ),

                  // Filter No Lactose Meals
                  buildSwitchListTile(
                    context,
                    "No Lactose",
                    "lactose-free",
                    currentFilters['lactose']!,
                    (newVal) {
                      setState(() {
                        currentFilters['lactose'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  ),

                  // Filter Vegeterian Meals
                  buildSwitchListTile(
                    context,
                    "Vegeterian",
                    "vegeterian",
                    currentFilters['vegeterian']!,
                    (newVal) {
                      setState(() {
                        currentFilters['vegeterian'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  ),

                  // Filter Vegan Meals
                  buildSwitchListTile(
                    context,
                    "Vegan",
                    "vegan",
                    currentFilters['vegan']!,
                    (newVal) {
                      setState(() {
                        currentFilters['vegan'] = newVal;
                      });
                      Provider.of<MealProvider>(context, listen: false)
                          .setFilters();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: const MainDrawer(),
      ),
    );
  }

  // ======================== Function to build Buttons to use in Filters =============================
  Container buildSwitchListTile(BuildContext context, String title,
      String subtitle, bool currentValue, Function(bool) updateValue) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).primaryColor,
      ),
      child: SwitchListTile(
        activeColor: Get.isDarkMode
            ? const Color.fromARGB(255, 255, 110, 0)
            : Colors.white,
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(
          "Only include $subtitle meals",
          style: Theme.of(context).textTheme.bodySmall,
        ),
        value: currentValue,
        onChanged: updateValue,
      ),
    );
  }
}
