import 'package:flutter/material.dart';
import 'package:sights_app/presentation/favorite/screen/favorite_screen.dart';
import 'package:sights_app/presentation/places/screen/place_list_screen.dart';
import 'package:sights_app/presentation/profile/screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final _screens = [
    PlaceListScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _changeScreen,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Places'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }

  void _changeScreen(int index) => setState(() => _selectedIndex = index);
}
