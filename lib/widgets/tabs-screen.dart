import 'package:flutter/material.dart';
import 'package:meals/widgets/categories_screen.dart';
import 'package:meals/widgets/drawer.dart';
import 'fav.dart';
import 'package:meals/models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favourites;
  TabsScreen(this.favourites);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  var _pages;
  @override
  void initState() {
    super.initState();
    _pages = [
      {'page': CategoryScreen(), 'title': 'Categories'},
      {'page': Favourites(widget.favourites), 'title': 'Your Favourites'}
    ];
  }

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        selectedItemColor: Theme.of(context).accentColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text('Categories')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favourites'))
        ],
      ),
    );
  }
}
