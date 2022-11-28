import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/screens/favpage.dart';
import 'package:ecommerce_app/screens/homepage.dart';
import 'package:ecommerce_app/screens/qrpage.dart';
import 'package:flutter/material.dart';
import '../Screens/favpage.dart' as favpage;
import 'profilepage.dart';
import 'searchpage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentindex = 0;
  final List<Widget> screens = [
    HomePage(),
    SearchPage(),
    QrCode(),
    FavPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_currentindex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border:
              Border.all(color: Theme.of(context).backgroundColor, width: 5),
        ),
        child: FloatingActionButton(
          elevation: 4,
          backgroundColor: Color(0xffFFCB11),
          onPressed: () {},
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            color: Color(0xff151515),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 78,
        decoration:
            const BoxDecoration(borderRadius: BorderRadius.only(), boxShadow: [
          BoxShadow(
            color: Color(0xff000000),
            blurRadius: 15,
            spreadRadius: 3,
          ),
        ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentindex,
            onTap: (index) {
              setState(() {
                _currentindex = index;
              });
            },
            selectedFontSize: 0,
            unselectedFontSize: 0,
            iconSize: 22,
            items: [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/home.png"),
                  color: Theme.of(context).selectedRowColor,
                ),
                label: '',
                activeIcon: ImageIcon(
                  AssetImage("assets/home.png"),
                  color: Color(0xffFFCB11),
                ),
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/search.png"),
                  color: Theme.of(context).selectedRowColor,
                ),
                label: '',
                activeIcon: ImageIcon(
                  AssetImage("assets/search.png"),
                  color: Color(0xffFFCB11),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: Color(0xff232327),
                icon: const SizedBox.shrink(),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/fav.png"),
                  color: Theme.of(context).selectedRowColor,
                ),
                activeIcon: ImageIcon(
                  AssetImage("assets/fav.png"),
                  color: Color(0xffFFCB11),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("assets/account.png"),
                  color: Theme.of(context).selectedRowColor,
                ),
                activeIcon: ImageIcon(
                  AssetImage("assets/account.png"),
                  color: Color(0xffFFCB11),
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
