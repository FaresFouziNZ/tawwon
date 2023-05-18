import 'package:flutter/material.dart';
import 'package:tawwon/screens/homePage.dart';
import 'package:tawwon/screens/orgnaization_view.dart';
import 'package:tawwon/screens/requests_view.dart';
import 'package:tawwon/screens/search_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    const HomePage(),
    const RequestsView(),
    const SearchScreen(),
    const OrganizationPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDAE5EA),
      body: _children[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
            color: Color(0xFF1B2430), // Set the container color here
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            backgroundColor: Colors.transparent, // Set the transparent background here
            selectedItemColor: Theme.of(context).colorScheme.onPrimary,
            unselectedItemColor: Theme.of(context).colorScheme.onPrimary,
            showUnselectedLabels: false,
            iconSize: 35,
            selectedFontSize: 12,
            onTap: onTabTapped,
            currentIndex: _selectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: 'الطلبات',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'بحث',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'صفحتي',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
