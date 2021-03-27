import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meals-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals Screen'),
      ),
      drawer: MainDrawer(),
      body: Container(
        child: Center(
          child: Text('Meals Screen'),
        ),
      ),
    );
  }
}
