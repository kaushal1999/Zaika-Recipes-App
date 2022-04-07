import 'package:flutter/material.dart';
import 'package:meals/widgets/drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  @override
  void initState() {
    super.initState();
    _glutenfree = widget.currentFilters['gluten']!;
    _lactosefree = widget.currentFilters['lactose']!;
    _vegan = widget.currentFilters['vegan']!;
    _vegetrian = widget.currentFilters['veg']!;
  }

  var _glutenfree = false;
  var _vegan = false;
  var _vegetrian = false;
  var _lactosefree = false;

  Widget _buildSwitchListTile(
      bool currentValue, String title, String descrtiption, Function update) {
    return SwitchListTile(
      value: currentValue,
      onChanged: (newvalue) {
        update(newvalue);
      },
      title: Text(title),
      subtitle: Text(descrtiption),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final Map<String, bool> selectedFilters = {
                  'gluten': _glutenfree,
                  'veg': _vegetrian,
                  'lactose': _lactosefree,
                  'vegan': _vegan
                };
                widget.saveFilters(selectedFilters);
              },
              icon: Icon(Icons.save))
        ],
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            'Set your filters',
            style: Theme.of(context).textTheme.title,
          ),
        ),
        _buildSwitchListTile(
            _glutenfree, 'Gluten-free', 'include only gluten free meals',
            (bool val) {
          setState(() {
            _glutenfree = val;
          });
        }),
        _buildSwitchListTile(
            _lactosefree, 'Lactose-free', 'include only lactose free meals',
            (bool val) {
          setState(() {
            _lactosefree = val;
          });
        }),
        _buildSwitchListTile(_vegetrian, 'Veg', 'include only veg meals',
            (bool val) {
          setState(() {
            _vegetrian = val;
          });
        }),
        _buildSwitchListTile(_vegan, 'Vegan', 'include only vegan meals',
            (bool val) {
          setState(() {
            _vegan = val;
          });
        }),
      ]),
    );
  }
}
