import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.currentTab, required this.onSelectTab});
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(TabItem.all),
        _buildItem(TabItem.favorite),
      ],
      onTap: (index) => onSelectTab(
        TabItem.values[index],
      ),
    );
  }

  BottomNavigationBarItem _buildItem(TabItem tabItem) {
    return BottomNavigationBarItem(
      icon: Icon(
        Icons.layers,
        color: _colorTabMatching(tabItem),
      ),
      label: tabName[tabItem],
    );
  }

  Color _colorTabMatching(TabItem item) {
    return currentTab == item ? Colors.green : Colors.grey;
  }
}

enum TabItem { all, favorite }

const Map<TabItem, String> tabName = {
  TabItem.all: 'All',
  TabItem.favorite: 'Favorite',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.all: Colors.red,
  TabItem.favorite: Colors.green,
};
