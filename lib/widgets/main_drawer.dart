import 'package:flutter/material.dart';
import '../screens/meals_screen.dart';
import '../screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function screenRoute) {
    return ListTile(
      onTap: screenRoute,
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontFamily: 'RobotoCondensed',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile('Home', Icons.home, () {
            Navigator.of(context).pushNamed('/');
          }),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushNamed(MealScreen.routeName);
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushNamed(FilterScreen.routeName);
          }),
        ],
      ),
    );
  }
}
