import 'package:flutter/material.dart';
import 'package:tawwon/screens/new_ui/profile_page_not_registered.dart';
import 'package:tawwon/screens/new_ui/search_page.dart';

class PageHolder extends StatefulWidget {
  const PageHolder({super.key});

  @override
  State<PageHolder> createState() => _PageHolderState();
}

class _PageHolderState extends State<PageHolder> {
  int _currentIndex = 0;
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F6),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          Center(
            child: Text('Home'),
          ),
          SearchPage(
            title: '',
          ),
          Center(
            child: Text('Favorites'),
          ),
          ProfilePageNotRegistered()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              label: 'favorites'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'profile'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          });
        },
      ),
    );
  }
}
