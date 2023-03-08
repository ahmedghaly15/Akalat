import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<String> _titles = [
    "Categories",
    "Favorite",
  ];
  List<Widget>? _tabs;

  @override
  void initState() {
    Provider.of<MealProvider>(context, listen: false).getData();
    _tabs = [
      const CategoriesScreen(),
      const FavoriteScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _titles[_selectedIndex],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          elevation: 9.5,
          scrolledUnderElevation: 8,
          toolbarHeight: 70,
          centerTitle: true,
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
          leading: Builder(builder: (BuildContext ctx) {
            return GestureDetector(
              onTap: () => Scaffold.of(ctx).openDrawer(),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(0, 255, 120, 0),
                child: CircleAvatar(
                  backgroundImage:
                      const AssetImage("assets/images/Logo/cheff logo.png"),
                  radius: MediaQuery.of(context).size.width * 0.04,
                ),
              ),
            );
          }),
        ),
        body: _tabs![_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
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
          child: GNav(
            onTabChange: (newIndex) =>
                setState(() => _selectedIndex = newIndex),
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            gap: 4,
            activeColor: Theme.of(context).textTheme.titleMedium!.color,
            color: Theme.of(context)
                .textTheme
                .titleMedium!
                .color!
                .withOpacity(0.5),
            padding: const EdgeInsets.all(19),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInExpo,
            style: GnavStyle.google,
            textStyle: Theme.of(context).textTheme.titleMedium,
            iconSize: 20,
            tabs: const <GButton>[
              GButton(
                icon: Icons.home,
                text: "Categories",
              ),
              GButton(
                icon: Icons.favorite,
                text: "Favorite",
              )
            ],
          ),
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
