import 'package:flutter/material.dart';
import '../dummy.dart';

class MealsDetail extends StatelessWidget {
  static const routeName = '/meals-detail';

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      // color: Colors.red,
      margin: EdgeInsets.all(10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.display2,
      ),
    );
  }

  Widget buildContainer(BuildContext context, Widget child) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height * 0.25,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeals =
        DUMMY_MEALS.firstWhere((element) => element.id == mealsId);
    final appBar = AppBar(
      title: Text('${selectedMeals.title}'),
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: (MediaQuery.of(context).size.height -
                      appBar.preferredSize.height) *
                  0.4,
              width: double.infinity,
              child: Image.network(
                selectedMeals.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
                context,
                ListView.builder(
                  itemBuilder: (ctx, index) => Text(
                    selectedMeals.ingredients[index],
                    style: Theme.of(context).textTheme.display3,
                  ),
                  itemCount: selectedMeals.ingredients.length,
                )),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              context,
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Theme.of(context).primaryColor,
                        child: Text(
                          '${index + 1}',
                        ),
                      ),
                      title: Text(
                        selectedMeals.steps[index],
                      ),
                    ),
                  ],
                ),
                itemCount: selectedMeals.steps.length,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
