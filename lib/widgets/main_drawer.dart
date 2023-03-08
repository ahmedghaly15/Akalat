import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_app/screens/log_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/filters_screen.dart';
import '../screens/tabs_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final user = FirebaseAuth.instance.currentUser!;

  // Getting User's Info
  getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.getString('mail')!;
    setState(() {});
  }

  @override
  void initState() {
    // Getting User's Info When The Drawer Is Opened
    getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ======================== Drawer Content =============================
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: UserAccountsDrawerHeader(
                margin: const EdgeInsets.only(bottom: 8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                accountName: const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  user.email!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                currentAccountPictureSize: const Size.square(65),
                currentAccountPicture: Container(
                  margin: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  buildListTile("Profile", Icons.person_2_rounded, () {}),
                  buildListTile("Offers", Icons.local_offer_rounded, () {}),
                  buildListTile(
                    "Categories",
                    Icons.restaurant_menu_rounded,
                    () {
                      // Navigating to TabsScreen
                      Get.offAll(
                        () => const TabsScreen(),
                        transition: Transition.fadeIn,
                      );
                    },
                  ),
                  buildListTile(
                    "Filters",
                    Icons.settings_rounded,
                    () {
                      // Navigating to FiltersScreen
                      Get.offAll(
                        () => const FiltersScreen(),
                        transition: Transition.fadeIn,
                      );
                    },
                  ),
                  buildListTile("Contact us", Icons.message_rounded, () {}),
                  buildListTile("About us", Icons.info_rounded, () {}),
                  buildListTile("Help", Icons.help_center_rounded, () {}),
                  buildListTile("Log out", Icons.logout_rounded, () async {
                    final prefs = await SharedPreferences.getInstance();

                    // Clearing Data Saved In SharedPreferences
                    prefs.clear();

                    // Navigating to LoginScrren
                    Get.offAll(
                      () => const LoginScreen(),
                      transition: Transition.fadeIn,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //===================== Building A List Tile Function =====================
  ListTile buildListTile(String title, IconData icon, Function() tapHandler) {
    return ListTile(
      leading:
          Icon(icon, color: const Color.fromARGB(255, 255, 90, 0), size: 22),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.normal,
          letterSpacing: 2,
          color: Color.fromARGB(255, 255, 90, 0),
        ),
      ),
      onTap: tapHandler,
    );
  }
}
