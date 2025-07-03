import 'package:flutter/material.dart';
import 'hub_screen.dart';
import 'tables_screen.dart';
import 'buddies_screen.dart';
import 'profile_screen.dart';
import '../utils/theme.dart';

/// MainNavScreen manages the bottom navigation bar and shows the correct screen for each tab.
class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0; // Which tab is selected

  // List of screens for each tab
  final List<Widget> _screens = const [
    HubScreen(),
    TablesScreen(),
    BuddiesScreen(),
    ProfileScreen(),
  ];

  // List of tab bar items (icons and labels)
  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_rounded),
      label: 'Hub',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.receipt_long),
      label: 'Tables',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.people),
      label: 'Buddies',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show the selected screen
      body: _screens[_currentIndex],
      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _navItems,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textSecondary,
        showUnselectedLabels: true,
      ),
    );
  }
} 