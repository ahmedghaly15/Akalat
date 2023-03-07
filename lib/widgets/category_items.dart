import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String backgroundImgUrl;

  const CategoryItem(this.id, this.title, this.backgroundImgUrl, {super.key});

  // Select A Category
  void selectCategory(BuildContext cntx) {
    Navigator.of(cntx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectCategory(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Theme.of(context).primaryColor,
        elevation: 13,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 45.5,
                child: CircleAvatar(
                  backgroundImage: AssetImage(backgroundImgUrl),
                  radius: 45.5,
                ),
              ),
              const SizedBox(height: 10),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.touch_app,
                    color: Theme.of(context).textTheme.headlineMedium!.color,
                    size: 25,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "Visit",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
