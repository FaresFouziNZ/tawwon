import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/screens/new_ui/favorite_page.dart';
import 'package:tawwon/screens/new_ui/home_page.dart';
import 'package:tawwon/screens/new_ui/profile_page_not_registered.dart';
import 'package:tawwon/screens/new_ui/progile_page_registered.dart';
import 'package:tawwon/screens/new_ui/search_page.dart';

class PageHolder extends StatefulWidget {
  const PageHolder({super.key});

  @override
  State<PageHolder> createState() => _PageHolderState();
}

class _PageHolderState extends State<PageHolder> {
  int _currentIndex = 3;
  final controller = PageController(initialPage: 3);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LocalUser?>(context);
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F6),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          user?.uid == null ? const ProfilePageNotRegistered() : const ProfilePageRegistered(),
          const FavoritePage(),
          const SearchPage(),
          const HomePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'profile'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              label: 'favorites'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              label: 'search'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            controller.jumpToPage(
              index,
            );
          });
        },
      ),
    );
  }
}
