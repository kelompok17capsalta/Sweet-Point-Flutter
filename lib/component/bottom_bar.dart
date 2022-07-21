import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:kel17/page/Homepage.dart';
import 'package:kel17/page/profile.dart';
import 'package:kel17/page/redeem.dart';
import 'package:kel17/page/tab_bar.dart';
import 'package:kel17/page/transaksi.dart';

// ignore: use_key_in_widget_constructors
class ButtomBar extends StatefulWidget {
  @override
  _ButtomBarState createState() => _ButtomBarState();
}

class _ButtomBarState extends State<ButtomBar> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          Test(),
          Transaksi(
            created: '',
            descriptions: '',
            status: '',
          ),
          Tabb(),
          Tukar(),
          Profile(),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: _currentPage,
        showActiveBackgroundColor: true,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: const <BottomBarItem>[
          BottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.transfer_within_a_station_sharp),
            title: Text('History'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.shopping_bag),
            title: Text('Shop'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.redeem_sharp),
            title: Text('Redeem'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
          BottomBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: Color.fromRGBO(143, 148, 251, 1),
          ),
        ],
      ),
    );
  }
}
