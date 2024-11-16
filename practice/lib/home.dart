import 'package:flutter/material.dart';
import 'trip_summary.dart';
import 'notes.dart';
import 'budget.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    TripSummaryScreen(),
    NotesScreen(),
    BudgetScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display selected page
      bottomNavigationBar: Container(
        color: Color(0xFF9E8A9D), // Dark purple background for navigation bar
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildNavItem(Icons.home, "HOME", 0),
            buildNavItem(Icons.airplane_ticket, "Trip Summary", 1),
            buildNavItem(Icons.note, "Notes", 2),
            buildNavItem(Icons.pie_chart, "Budget", 3),
            buildNavItem(Icons.person, "Profile", 4),
          ],
        ),
      ),
    );
  }

  GestureDetector buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: _selectedIndex == index ? Colors.black : Colors.white,
            size: 30,
          ),
          Text(
            label,
            style: TextStyle(
              color: _selectedIndex == index ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Welcome to the Home Page", style: TextStyle(fontSize: 24)),
    );
  }
}
