import 'package:flutter/material.dart';
import '../models/meals.dart';
import '../widgets/meal_item.dart';
import '../dummy.dart';

class CategoriesMealsScreen extends StatefulWidget {
  static const routeName = '/categories-meals';
  final List<Meals> availableMeals;

  CategoriesMealsScreen(this.availableMeals);

  @override
  _CategoriesMealsScreenState createState() => _CategoriesMealsScreenState();
}

class _CategoriesMealsScreenState extends State<CategoriesMealsScreen> {
  var _loadedInitData = false;
  List<Meals> displayedMeals;
  String categoryTitle;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final id = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      print('receipe id $id');
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('$categoryTitle Receipes'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => print('clicked'),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
