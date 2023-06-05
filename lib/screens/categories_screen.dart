import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:meal_app/providers/meal_provider.dart';
import 'package:provider/provider.dart';
import '../Widgets/category_items.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ======================== Screen Content =============================
    return SafeArea(
      child: Scaffold(
        body: GridView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          reverse: false,
          primary: true,
          shrinkWrap: true,
          dragStartBehavior: DragStartBehavior.start,
          clipBehavior: Clip.hardEdge,
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisExtent: 200,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2,
          ),
          children: Provider.of<MealProvider>(context)
              .avialableCategories
              .map(
                (catData) => AnimationConfiguration.staggeredGrid(
                  position: int.parse(catData.id[1]),
                  duration: const Duration(milliseconds: 650),
                  columnCount: Provider.of<MealProvider>(context)
                      .avialableCategories
                      .length,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: CategoryItem(
                        catData.id,
                        catData.title,
                        catData.backgroundImgUrl,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
