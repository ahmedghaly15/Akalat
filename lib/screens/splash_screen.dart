import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/splash_screen_controller.dart';
import 'log_in_screen.dart';
import 'tabs_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashController = Get.put(SplashController());

  gotoApp() async {
    final prefs = await SharedPreferences.getInstance();
    String? val = prefs.getString('mail');
    if (val == null) {
      // Navigating to LoginScreen
      Get.off(const LoginScreen(), transition: Transition.fadeIn);
    } else {
      // Navigating to TabsScreen
      Get.offAll(const TabsScreen(), transition: Transition.fadeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => const SplashScreen());

    splashController.startAnimation();

    // ======================== Screen Content =============================
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(255, 255, 110, 0),
            Color.fromARGB(255, 255, 177, 117)
          ])),

          // building the layout
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  Obx(
                    () => AnimatedPositioned(
                      duration: const Duration(milliseconds: 2500),
                      top: splashController.animate.value ? -130 : 0,
                      left: splashController.animate.value ? 280 : 0,
                      child: Container(
                        height: constraints.maxHeight * 0.75,
                        width: constraints.maxWidth * 0.80,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 255, 120, 0),
                                const Color.fromARGB(255, 255, 115, 0)
                                    .withOpacity(0.3)
                              ],
                            ),
                            shape: BoxShape.circle),
                      ),
                    ),
                  ),

                  // for creating the red ball
                  Obx(
                    () => AnimatedPositioned(
                        duration: const Duration(milliseconds: 2500),
                        top: splashController.animate.value ? 60 : 0,
                        left: splashController.animate.value ? -40 : 0,
                        child: Container(
                          height: constraints.maxHeight * 0.80,
                          width: constraints.maxWidth * 0.50,
                          decoration: const BoxDecoration(
                              color: Color(0XFFFFD88B), shape: BoxShape.circle),
                        )),
                  ),

                  Center(
                    child: Stack(
                      children: [
                        ///============== App Logo ===================
                        Obx(
                          () => AnimatedPositioned(
                            duration: const Duration(milliseconds: 2500),
                            top: splashController.animate.value ? 140 : 0,
                            right: constraints.maxWidth * 0.07,
                            child: const CircleAvatar(
                              radius: 160,
                              child: CircleAvatar(
                                backgroundImage: AssetImage(
                                    'assets/images/Logo/cheff logo.png'),
                                radius: 160,
                              ),
                            ),
                          ),
                        ),

                        ///============== App Name ===================
                        Obx(
                          () => AnimatedPositioned(
                              duration: const Duration(milliseconds: 2200),
                              bottom: splashController.animate.value ? 190 : 0,
                              left: splashController.animate.value ? 12 : 0,
                              child: SizedBox(
                                width: 263.w,
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 2200),
                                  opacity:
                                      splashController.animate.value ? 1 : 0,
                                  child: Text(
                                    "Akalat",
                                    style: TextStyle(
                                      fontSize: 35.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontFamily: "Gilroy-Bold",
                                    ),
                                  ),
                                ),
                              )),
                        ),

                        ///============== Introducing The App ===================
                        Obx(
                          () => AnimatedPositioned(
                            duration: const Duration(milliseconds: 2200),
                            bottom: splashController.animate.value ? 160 : 0,
                            left: splashController.animate.value ? 12 : 0,
                            child: SizedBox(
                              width: 299.w,
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 2200),
                                opacity: splashController.animate.value ? 1 : 0,
                                child: Text(
                                  "Different meals with ingredients and steps",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                    fontFamily: "Gilroy",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        ///============== Get Started Button ===================
                        Obx(
                          () => AnimatedPositioned(
                            duration: const Duration(milliseconds: 2200),
                            bottom: splashController.animate.value ? 50 : 0,
                            left: splashController.animate.value ? 40 : 0,
                            child: SizedBox(
                              width: 290.w,
                              height: 62.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0XFFFFFFFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                                onPressed: gotoApp,
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Gilroy",
                                      fontSize: 21.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
