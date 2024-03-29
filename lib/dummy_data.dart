// ======================== App Data ========================
import 'models/category.dart';
import 'models/meal.dart';

// ======================== Categories ========================
const dummyCategories = [
  Category(
    id: 'c1',
    title: 'Italian',
    backgroundImgUrl: 'assets/images/Categories/italian category.png',
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    backgroundImgUrl: 'assets/images/Categories/quick category.jpeg',
  ),
  Category(
    id: 'c3',
    title: 'Hamburgers',
    backgroundImgUrl: 'assets/images/Categories/hamburgers category.png',
  ),
  Category(
    id: 'c4',
    title: 'German',
    backgroundImgUrl: 'assets/images/Categories/german category.jpg',
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    backgroundImgUrl: 'assets/images/Categories/lovely category.png',
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    backgroundImgUrl: 'assets/images/Categories/exotic category.png',
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    backgroundImgUrl: 'assets/images/Categories/breakfast category.jpeg',
  ),
  Category(
    id: 'c8',
    title: 'Asian',
    backgroundImgUrl: 'assets/images/Categories/asian category.jpeg',
  ),
  Category(
    id: 'c9',
    title: 'French',
    backgroundImgUrl: 'assets/images/Categories/french category.jpeg',
  ),
  Category(
    id: 'c10',
    title: 'Summer',
    backgroundImgUrl: 'assets/images/Categories/summer category.jpeg',
  ),
];

// ======================== Meals ========================
List<Meal> dummyMeals = [
  Meal(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Spaghetti with Tomato Sauce.jpeg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c1',
    ],
    title: 'Risotto',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Risotto.jpeg',
    duration: 20,
    ingredients: [
      'A high-starch (amylopectin)',
      'Low-amylose round medium- or short- grain white rice',
      'Arborio',
      'Carnaroli',
      'Maratelli',
      'Padano'
    ],
    steps: [
      'Warm the broth in a medium saucepan over low heat, which helps the risotto come together faster.',
      'Melt the butter in a 10- or 12-inch straight-sided sauté pan or Dutch oven over medium heat.',
      'Add the rice and stir until every grain is coated with the butter. Add more fat if needed.',
      " Deglazing the pan at this point isn't strictly necessary, but a splash of white wine will add another layer of flavor.",
      'Begin incrementally adding the broth one 1/2 cup at a time, stirring regularly between additions.',
      'Begin tasting the rice after about 12 minutes to gauge how far it has cooked.',
      'As a final step, add 1 or 2 more tablespoons of butter if desired.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c1',
    ],
    title: 'Bistecca Alla Fiorentina',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl: 'assets/images/Meals/Bistecca Alla Fiorentina.jpeg',
    duration: 40,
    ingredients: [
      'Steak',
      'Herbs',
      'Seasonings ',
      'Fat',
    ],
    steps: [
      "Make the baster by wrapping the fresh herbs up in butcher's twine.",
      'Next, brush both sides of the steak with olive oil.',
      'Season the steak on both sides with salt, pepper, onion, and garlic granules.',
      "Make sure your griddle is hot before placing down your meat.",
      'Be sure to baste it with the butter and brush it with the fresh herbs for just an awesome little added touch.',
      'Serving a Florentine Steak is as simple as brushing it one last time.',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm4',
    categories: [
      'c1',
    ],
    title: 'Lasagne',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/Meals/Lasagne.jpeg',
    duration: 40,
    ingredients: [
      'Cheese Filling',
      'Meat',
      'Sauce',
      'Spinach (variation)',
    ],
    steps: [
      "Cook in a large pot of salted water.",
      'Cook sausage and beef with onion and garlic.',
      'Stir the cheese mixture together in a bowl.',
      "Layer the meat sauce and cheese mixture with lasagna noodles and bake.",
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm5',
    categories: [
      'c2',
    ],
    title: 'Toast Hawaii',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Toast Hawaii.jpeg',
    duration: 10,
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter'
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm6',
    categories: [
      'c2',
    ],
    title: 'Muffin',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Muffin.jpeg',
    duration: 20,
    ingredients: [
      '2 1/2 cups all-purpose flour',
      '1/2 cup granulated sugar',
      '1/4 teaspoon fine salt',
      '1 1/4 cups milk',
      '1/2 cup vegetable oil',
      '1 large egg',
      '1 teaspoon vanilla extract (optional)',
    ],
    steps: [
      'Arrange a rack in the middle of the oven and heat to 375°F.',
      'Whisk the flour, sugar, baking powder, and salt together in a large bowl.',
      'Whisk the milk, oil, egg, and vanilla if using together in a medium bowl.',
      'Pour the wet ingredients into the dry and mix with a wooden spoon.',
      "If you're adding mix-ins to your muffins, fold in the fruit, chocolate chips.",
      'Divide the batter amongst the prepared muffin wells, about 1/3 cup of batter per well.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm7',
    categories: [
      'c2',
    ],
    title: 'Tacos',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Taco.jpeg',
    duration: 20,
    ingredients: [
      '1 pound lean (at least 80%) ground beef',
      "1 cup Old El Paso™ Thick 'n Chunky salsa",
      '10 Old El Paso™ taco shells',
      '1/2 head lettuce, shredded',
      '1 medium tomato, chopped (3/4 cup)',
      '1 cup shredded Cheddar cheese (4 ounces)',
    ],
    steps: [
      'Cook beef in 10-inch skillet over medium heat 8 to 10 minutes.',
      'Stir salsa into beef. Heat to boiling, stirring constantly.',
      'Reduce heat to medium-low. Cook 5 minutes, stirring occasionally.',
      'Pour the wet ingredients into the dry and mix with a wooden spoon.',
      "Pour beef mixture into large serving bowl.",
      'Heat taco shells as directed on package.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm8',
    categories: [
      'c2',
    ],
    title: 'Pan-fried camembert sandwich',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Pan-fried camembert sandwich.jpeg',
    duration: 30,
    ingredients: [
      '2 ounces Camembert cheese',
      "2 thick slices white bread",
      '1 tablespoon whole cranberry sauce',
      '1 dash balsamic vinegar',
      '1 tablespoon butter, softened',
    ],
    steps: [
      'Spread the Camembert cheese evenly onto one slice of bread.',
      'Heat a skillet over medium heat. Fry the sandwich for a few minutes on each side.',
      'Slice in half, and eat straight away!',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm9',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Classic Hamburger',
    affordability: Affordability.pricey,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm10',
    categories: [
      'c3',
    ],
    title: 'Turkey Burger',
    affordability: Affordability.affordable,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/Meals/turky burger.jpeg',
    duration: 60,
    ingredients: [
      '1 lb. ground turkey',
      '1 large egg, beaten',
      '2 cloves garlic, minced',
      '1 tbsp. Worcestershire sauce',
      'Kosher salt',
      'Freshly ground black pepper',
      'Hamburger buns',
      'Lettuc',
      'Mayonnaise',
      'Sliced tomatoes',
    ],
    steps: [
      'In a large bowl, mix together turkey, egg, garlic, Worcestershire sauce, and parsley, then season with salt and pepper.',
      'Form mixture into four flat patties.',
      'In a medium skillet over medium heat, heat oil.',
      ' Add patties and cook until golden and cooked through, 5 minutes per side. Serve on a bun with desired toppings.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm11',
    categories: [
      'c3',
    ],
    title: 'Veggie Burger',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl: 'assets/images/Meals/Veggie burger.jpeg',
    duration: 45,
    ingredients: [
      'shiitake and portobello mushrooms',
      'Tamari, balsamic vinegar, and mirin',
      'Smoked paprika and sriracha',
      'Finely chopped garlic and shallots',
      'Short grain brown rice',
      'Panko bread crumbs',
      'Ground flaxseed',
    ],
    steps: [
      "Use rice that's hot off the stove.",
      'Brush them with vegan Worcestershire sauce after cooking.',
      'Roast the vegetables until caramelized and extra moisture has evaporated.',
      'Roast the beans for about 15 minutes so they split open and dry out a bit.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm12',
    categories: [
      'c3',
    ],
    title: 'Bean Burger',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/Meals/Bean burger.jpeg',
    duration: 30,
    ingredients: [
      '1/2 green bell pepper, cut into 2 inch pieces',
      '1/2 onion, cut into wedges',
      '3 cloves garlic, peeled',
      '1 egg',
      '1 tablespoon chili powder',
      '1 tablespoon cumin',
      '1 teaspoon Thai chili sauce or hot sauce',
    ],
    steps: [
      "Preheat an outdoor grill for high heat. Lightly oil a sheet of aluminum foil with cooking spray.",
      'Mash black beans in a medium bowl with a fork until thick and pasty.',
      'Finely chop bell pepper, onion, and garlic in a food processor. Stir chopped vegetables into mashed beans.',
      'Stir together egg, chili powder, cumin, and chili sauce in a small bowl.',
      'Add to the mashed beans and stir to combine.',
      'Mix in bread crumbs until the mixture is sticky and holds together.',
      'Grill on the preheated grill for about 8 minutes on each side.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm13',
    categories: [
      'c4',
    ],
    title: 'Wiener Schnitzel',
    affordability: Affordability.luxurious,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/Meals/schnitzel-3279045_1280.jpg',
    duration: 60,
    ingredients: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices'
    ],
    steps: [
      'Tenderize the veal to about 2-4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes fluffy.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm14',
    categories: [
      'c4',
    ],
    title: 'Labskaus',
    affordability: Affordability.pricey,
    complexity: Complexity.hard,
    imageUrl: 'assets/images/Meals/Labskaus.jpeg',
    duration: 30,
    ingredients: [
      '1 small onion, chopped',
      '4 teaspoons unsalted butter, or margarine, divided',
      '1/2 cup milk',
      '1 cup beef broth',
      '10 ounces corned beef, homemade or canned, chopped',
      '3 large eggs',
      'Salt, to taste',
      '1 tablespoon pickled beet juice',
    ],
    steps: [
      'Cook the potatoes in salted water until soft.',
      'Brown the onions in 2 teaspoons butter for 3 minutes and remove from heat.',
      'Brown the corned beef cubes in the same pan until warmed through.',
      'Chop 5 beet slices small, reserving the rest.',
      'Using a non-stick pan, melt 2 teaspoons butter and fry the 3 eggs. Salt and pepper to taste.',
      'Divide the labskaus onto 3 pre-warmed plates.',
      'Arrange 1 fried egg on top of each mound of labskaus, add the rollmops, the reserved pickled red beets, and spicy German pickles and serve immediately.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm15',
    categories: [
      'c4',
    ],
    title: 'Königsberger Klopse',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/Meals/Königsberger klopse.jpeg',
    duration: 30,
    ingredients: [
      '2 slices day-old bread',
      '1 tablespoon unsalted butter',
      '1/2 pound ground pork',
      '1 to 2 large egg yolks',
      '1/4 teaspoon freshly ground black pepper',
      '4 cups vegetable broth, or beef broth',
      '5 whole black peppercorns, cracked',
      '1 bay leaf, optional',
    ],
    steps: [
      'Gather the ingredients.',
      'Soak the day-old bread in water and squeeze it until almost dry. Break it into small pieces',
      'Melt the butter and cook the finely chopped onion until translucent. Cool slightly.',
      'In a large bowl, place the pork and beef, cooked onions, and pieces of bread.',
      'Add 1 egg yolk, salt, and pepper and mix well.',
      "If the mixture can't be formed into meatballs, add a few tablespoons of broth. Form into 12 meatballs.",
      'Add the meatballs to the sauce, warm through, and serve.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm16',
    categories: [
      'c4',
    ],
    title: 'Käsespätzle',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Käsespätzle.jpeg',
    duration: 30,
    ingredients: [
      '1 batch Homemade German Spätzle',
      '6 tablespoons butter',
      '2 very large onions , chopped',
      '1/2 teaspoon salt',
      '1/2 teaspoon sugar',
    ],
    steps: [
      'Sift together flour, nutmeg, salt, and pepper. Beat eggs in a medium bowl.',
      'Bring a large pot of lightly salted water to a boil. Press batter through a spaetzle press into the water.',
      'Melt butter in a large skillet over medium-high heat. Add onion and cook until golden.',
      ' Stir in spaetzle and remaining 1/2 cup cheese until well blended. Remove from heat, and serve immediately.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm17',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm18',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Tossed salad',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Tossed salad.jpeg',
    duration: 10,
    ingredients: [
      'Lettuce',
      'Vegetables',
      'Cheese',
    ],
    steps: [
      'Add all the salad ingredients to a bowl',
      'Place salad greens in a salad bowl and top with tomatoes, cucumbers, onion, and carrot.'
          'Place oil, vinegar and sugar in a small plastic container.',
      'Put the lid on the container and shake dressing until sugar dissolves, about 1 minute.',
      'Pour dressing over salad. Season salad with salt and pepper, to taste, and toss to combine.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm19',
    categories: ['c5'],
    title: 'Palak Dal Khichdi',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Palak Dal Khichdi.jpeg',
    duration: 20,
    ingredients: [
      '1/2 cup rice (washed)',
      '1/2 cup moong dal',
      '1/4 tsp turmeric / haldi',
      '3 cup water',
      '1 inch cinnamon',
      'tomato',
      '1 green chilli (slit)',
      '1 cup water',
    ],
    steps: [
      'Firstly in a kadai heat 1 tbsp ghee and saute 1 tsp cumin, 2 pods cardamom, 1 inch cinnamon, 1 bay leaf and 1 dried red chilli.',
      'Add palak puree and cook for 5 minutes or till palak changes colour.',
      'Further, add pressure cooked rice and moong dal.',
      'Simmer and boil for 5 minutes or till khichdi absorbs palak flavour.',
      'Finally, serve palak khichdi hot topped with more ghee if required.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm20',
    categories: ['c5'],
    title: 'Low-Calorie Oats Idli',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/Low-Calorie Oats Idli.jpeg',
    duration: 30,
    ingredients: [
      '2 Cups oats',
      '1/2 litre curd (slightly sour)',
      '1 tbsp mustard seeds',
      '1/2 tbsp channa dal',
      '2 tsp green chillies, finely chopped',
      '1 cup carrots, grated',
      '2 tbsp salt',
      '1/2 tbsp turmeric powder',
      'A pinch of fruit salt',
    ],
    steps: [
      'On a tawa, dry roast the oats until it turns slightly brown and then powder the oats in a mixer.',
      'In a pan, add oil, mustard seeds, urad dal, channa dal and allow the mustard to splutter and the dals to turn golden.',
      'To this, add the chopped chillies, coriander and grated carrots.',
      'Add the turmeric powder and fry for a minute.',
      "Add this seasoning to the powdered oats mixture and add the curd to it to make a batter like that of idli batter's consistency.",
      'Grease the idli steamer plates with oil and pour the batter into each area of the steamer.',
      'You can add as much curd to the mixture to achieve the consistency, but do not add water to the batter.',
      'Steam the idlis for 15 minutes.',
      'Once done, remove the idlis and serve with Onion chutney.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm21',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Delicious Orange Mousse',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'assets/images/Meals/orange .jpg',
    duration: 240,
    ingredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm22',
    categories: [
      'c7',
    ],
    title: 'Pancakes',
    affordability: Affordability.affordable,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/pancake-3529653_1280.jpg',
    duration: 20,
    ingredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm23',
    categories: [
      'c8',
    ],
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.pricey,
    complexity: Complexity.challenging,
    imageUrl: 'assets/images/Meals/indian-food-3482749_1280.jpg',
    duration: 35,
    ingredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Meal(
    id: 'm24',
    categories: [
      'c9',
    ],
    title: 'Chocolate Souffle',
    affordability: Affordability.affordable,
    complexity: Complexity.hard,
    imageUrl: 'assets/images/Meals/souffle-412785_1280.jpg',
    duration: 45,
    ingredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Meal(
    id: 'm25',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.luxurious,
    complexity: Complexity.simple,
    imageUrl: 'assets/images/Meals/asparagus-3304997_1280.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];
