import 'package:flutter/material.dart';
import 'package:meals/widgets/filters.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);
  Widget buildListTile(IconData icon, String title, Function tapHandler) {
    return ListTile(
      onTap: () => tapHandler(),
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoCondensed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
              height: 150,
              width: double.infinity,
              color: Theme.of(context).accentColor,
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20),
              child: Text(
                'Aur mere chatore',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 26,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.w900),
              )),
          buildListTile(Icons.restaurant, 'Meals', () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buildListTile(Icons.settings, 'Filters', () {
            Navigator.pushReplacementNamed(context, FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
