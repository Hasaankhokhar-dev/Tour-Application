import 'package:flutter/material.dart';
import 'package:t_m/Authentication/signInScreen.dart';
import 'package:t_m/NavigationFile/Recomendation.dart';
import 'package:t_m/NavigationFile/Explorepk.dart';
import 'package:t_m/NavigationFile/Favourite.dart';
import 'Plannerscreen.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({super.key});

  @override
  State<BottomNavi> createState() => BottomNaviState();
}

class BottomNaviState extends State<BottomNavi> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    Explore(),
    PlannerScreen(),
    Recomendation(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black.withOpacity(.7),
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.recommend),
            label: 'Recommend',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
