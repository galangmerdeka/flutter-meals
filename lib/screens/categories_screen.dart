import 'package:flutter/material.dart';
import '../widgets/categories_item.dart';
import '../dummy.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final appBar = AppBar(
    //   title: Text("Delimeals"),
    //   actions: <Widget>[
    //     IconButton(
    //       icon: Icon(Icons.add),
    //       onPressed: () => null,
    //     ),
    //   ],
    // );
    return Scaffold(
      // appBar: appBar,
      body: GridView(
        padding: const EdgeInsets.all(25),
        children: DUMMY_CATEGORIES
            .map(
              (e) => CategoryItem(
                e.id,
                e.title,
                e.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
