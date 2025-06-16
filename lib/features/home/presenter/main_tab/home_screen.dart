import 'package:flutter/material.dart';

import 'home_tab/main_tab.dart';
import 'lesson_schedule/lesson_schedule_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FA),
      body: IndexedStack(
        index: index,
        children: [
          StudentDashboard(),
          TimetableScreen(),
          Container(color: Colors.green),
          Container(color: Colors.green),
          Container(color: Colors.green),
        ],
      ),
      bottomNavigationBar: _BottomNav(selectedIndex: index, onTap: _onItemTapped),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      this.index = index;
    });
  }
}


class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.selectedIndex,
    required this.onTap});

  final ValueChanged<int> onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 64,
      selectedIndex: selectedIndex,
      onDestinationSelected: onTap,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Asosy',),
        NavigationDestination(icon: Icon(Icons.calendar_month_outlined), label: 'Dars jadvali'),
        NavigationDestination(icon: Icon(Icons.fact_check_outlined), label: 'Fanlar'),
        NavigationDestination(icon: Icon(Icons.favorite_border), label: 'Foydali'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profil'),
      ],
    );
  }
}