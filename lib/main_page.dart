import 'package:flutter/material.dart';
import 'package:login_page_dio/pages/card_page.dart';
import 'package:login_page_dio/pages/page_2.dart';
import 'package:login_page_dio/pages/list_view_h.dart';
import 'package:login_page_dio/shared/custom_drawer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sua conta"),
        ),
        drawer: const CustomDrawer(),
        body: PageView(
          controller: _pageController,
          onPageChanged: (_)=> setState(() {
            currentIndex = _;
          }),
          scrollDirection: Axis.vertical,
          children: const [
            CardPage(),
            Page2(),
            ListViewH()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (_)=> _pageController.jumpToPage(_),
          currentIndex: currentIndex,
          items: const [
            BottomNavigationBarItem(label: "Pag1", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
            BottomNavigationBarItem(label: "Pag3", icon: Icon(Icons.person))
          ],
        ),
      ),
    );
  }
}
