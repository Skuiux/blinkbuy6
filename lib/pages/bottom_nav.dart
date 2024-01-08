
import 'package:blinkbuy6/pages/profile.dart';
import 'package:blinkbuy6/pages/wallet.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'order.dart';
class BottomNav extends StatefulWidget{
  const BottomNav ({super.key});
  @override
  State<BottomNav>createState () => _BottomNavState();

}
class _BottomNavState extends State<BottomNav> {
  int currentTabIndex=0;

  late List<Widget> pages;
  late Widget currentPage;
  late Home homepage;
  late Profile profile;
  late Order order;
  late Wallet wallet;

  @override
  void initState (){
    homepage=const Home();
    order=const Order();
    profile=const Profile();
    wallet=const Wallet();
    pages=[ homepage, order, wallet, profile];

    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar
        (height: 70,
        backgroundColor: Colors.limeAccent,
        animationDuration: const Duration(microseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [Icon(
          Icons.home_outlined,
          color: Colors.black,
      ),
        Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
        ),
        Icon(
          Icons.wallet_outlined,
          color: Colors.black,
        ),
        Icon(
          Icons.person_outline,
          color: Colors.black,
        ),

        ],),
      body: pages[currentTabIndex],
    );
  }
}