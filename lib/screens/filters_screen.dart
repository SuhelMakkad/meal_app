import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(this.currentFilters, this.saveFilters, {Key? key})
      : super(key: key);

  static const routeName = "/filters";

  final void Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    super.initState();

    _glutenFree = widget.currentFilters["gluten"] as bool;
    _vegetarian = widget.currentFilters["vegetarian"] as bool;
    _vegan = widget.currentFilters["vegan"] as bool;
    _lactoseFree = widget.currentFilters["lactose"] as bool;
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subTitle,
    required bool value,
    required void Function(bool) onChnage,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      activeColor: Theme.of(context).colorScheme.secondary,
      value: value,
      onChanged: onChnage,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Filters"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedfilter = {
                "gluten": _glutenFree,
                "lactose": _vegetarian,
                "vegan": _vegan,
                "vegetarian": _lactoseFree,
              };

              widget.saveFilters(selectedfilter);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  title: "Gluten-Free",
                  subTitle: "Only include gluten-free meal",
                  value: _glutenFree,
                  onChnage: (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: "Lactose-Free",
                  subTitle: "Only include lactose-free meal",
                  value: _lactoseFree,
                  onChnage: (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: "Vegetarian",
                  subTitle: "Only include vegetarian meal",
                  value: _vegetarian,
                  onChnage: (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  title: "Vegan",
                  subTitle: "Only include vegan meal",
                  value: _vegan,
                  onChnage: (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
