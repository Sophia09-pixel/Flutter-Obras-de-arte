import 'package:flutter/material.dart';
import 'package:obras_de_arte/screens/home/tab_favorites.dart';
import 'package:obras_de_arte/screens/home/tab_home.dart';
import 'package:obras_de_arte/screens/home/tab_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late final List<HomeTab> _tabs = [
    HomeTab(title: 'Obras de Arte', icon: Icons.brush, content: TabHome()),
    HomeTab(title: 'Favoritos', icon: Icons.favorite, content: TabFavorites()),
    HomeTab(
      title: 'Configurações',
      icon: Icons.settings,
      content: TabSettings(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final currentTab = _tabs[_selectedIndex];
    return Scaffold(
      appBar: AppBar(title: Text(currentTab.title)),
      body: currentTab.content,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _tabs
            .map(
              (tab) => BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.title,
              ),
            )
            .toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomeTab {
  final String title;
  final IconData icon;
  final Widget content;
  HomeTab({required this.title, required this.icon, required this.content});
}
