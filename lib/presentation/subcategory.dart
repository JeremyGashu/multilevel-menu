import 'package:flutter/material.dart';
import 'package:multiilevel/data/models/subcategory.dart';

class SubCategories extends StatelessWidget {
  final List<Subcategories> subcategories;

  SubCategories({this.subcategories});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: subcategories.length,
          itemBuilder: (ctx, index) {
            return subcategories[index].details != null
                ? ListTile(
                    contentPadding: EdgeInsets.all(10),
                    onTap: () {
                      if (subcategories[index].subcategories != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => SubCategories(
                                      subcategories:
                                          subcategories[index].subcategories,
                                    )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Trigger some event(buy or add to cart) if it has no sub-category.')));
                      }
                    },
                    title: Text(
                      subcategories[index].name,
                    ),
                    subtitle: Text(subcategories[index].details.detail),
                    trailing: Container(
                      width: 100,
                      child: Row(
                        children: [
                          Text(
                            '${subcategories[index].details.price}',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            subcategories[index].details.status,
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListTile(
                    onTap: () {
                      if (subcategories[index].subcategories != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => SubCategories(
                                      subcategories:
                                          subcategories[index].subcategories,
                                    )));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                'Trigger some event(buy or add to cart) if it has no sub-category.')));
                      }
                    },
                    title: Text(
                      subcategories[index].name,
                    ),
                  );
          }),
    );
  }
}
