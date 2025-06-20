import 'package:flutter/material.dart';
import 'package:hemis_demo/features/main/presenter/main_tab/profile/profile_tab.dart';
import 'package:hemis_demo/features/main/presenter/main_tab/subject_tab/subjects_page.dart';
import 'package:hemis_demo/features/main/presenter/main_tab/use_full/use_full_page.dart';

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
          SubjectsPage(),
          UseFullPage(),
          ProfileTab()
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
        NavigationDestination(icon: Icon(Icons.subject_outlined), label: 'Fanlar'),
        NavigationDestination(icon: Icon(Icons.more_horiz_outlined), label: 'Foydali'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profil'),
      ],
    );
  }
}