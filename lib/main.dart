import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_details_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/tabs_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ======================== Initializing Firebase ========================
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // ======================== Calling Our Provider & Running App ========================
  runApp(
    ChangeNotifierProvider<MealProvider>(
      create: (ctx) => MealProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (BuildContext context, _) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              // ======================== App Theme Settings ========================
              themeMode: ThemeMode.light,
              theme: ThemeData(
                primaryColor: const Color.fromARGB(255, 255, 110, 0),
                canvasColor: Colors.white, // Color.fromRGBO(14, 22, 33, 1)
                cardColor: Colors.white,
                textTheme: ThemeData.light().textTheme.copyWith(
                      titleLarge: const TextStyle(
                        fontFamily: 'OpenSans',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                        letterSpacing: 2,
                      ),
                      titleMedium: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                      titleSmall: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.white,
                      ),
                      headlineLarge: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 2,
                        color: Color.fromARGB(255, 255, 135, 43),
                      ),
                      headlineMedium: const TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 18.5,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1.5,
                        color: Color(0XFFFFD88B),
                      ),
                      bodyLarge: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 1.5,
                        wordSpacing: 0.2,
                        color: Color.fromARGB(255, 251, 170, 108),
                      ),
                      bodyMedium: const TextStyle(
                        fontFamily: 'Gilory',
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        letterSpacing: 0.8,
                        color: Colors.white,
                      ),
                    ),
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 255, 110, 0),
                  size: 23,
                ),
              ),

              // ======================== First Screen Of Our App ========================
              home: const SplashScreen(),

              // ======================== Routes to App Screens ========================
              routes: {
                '/tabs': (context) => const TabsScreen(),
                CategoryMealsScreen.routeName: (context) =>
                    const CategoryMealsScreen(),
                MealDetailsScreen.routeName: (context) =>
                    const MealDetailsScreen(),
              },
            ));
  }
}
