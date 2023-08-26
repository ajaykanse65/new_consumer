import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/mainScreen/home_screen.dart';


class RouteScreenContent extends StatefulWidget {
  const RouteScreenContent({super.key});

  @override
  State<RouteScreenContent> createState() => _RouteScreenContentState();
}

class _RouteScreenContentState extends State<RouteScreenContent> {
  int _selectedIndex = 0;
 //New
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Center(
      child: Text("Service"),
    ),Center(
      child: Text("My Cart"),
    ),Center(
      child: Text("Orders"),
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedLabelStyle: GoogleFonts.inter(
            color: const Color(0xFF59A4FF),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            color: const Color(0xFF8E8E8E),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          selectedItemColor: const Color(0xff59A4FF),
          unselectedItemColor: const Color(0xff8E8E8E),
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/menu/home_menu_active.svg',
                width: 24,
                height: 24,
              ),
              icon: SvgPicture.asset(
                'assets/menu/home_menu.svg',
                width: 24,
                height: 24,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/menu/service_menu_active.svg',
                  width: 24,
                  height: 24,
                ),
                icon: SvgPicture.asset(
                  'assets/menu/service_menu.svg',
                  width: 24,
                  height: 24,
                ),
                label: "Services"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/menu/cart_menu_active.svg',
                  width: 24,
                  height: 24,
                ),
                icon: SvgPicture.asset(
                  'assets/menu/cart_menu.svg',
                  width: 24,
                  height: 24,
                ),
                label: "My Cart"),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset(
                  'assets/menu/orders_menu_active.svg',
                  width: 24,
                  height: 24,
                ),
                icon: SvgPicture.asset(
                  'assets/menu/orders_menu.svg',
                  width: 24,
                  height: 24,
                ),
                label: "Orders"),
          ]),
    );
  }
}
