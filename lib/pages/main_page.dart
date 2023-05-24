import 'package:flutter/material.dart';
import 'package:login_page_dio/pages/dados_cadastrais.dart';
import 'package:login_page_dio/pages/page_1.dart';
import 'package:login_page_dio/pages/page_2.dart';
import 'package:login_page_dio/pages/page_3.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sua conta"),
        ),
        drawer: Drawer(
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  const Divider(color: Colors.white,),
                  InkWell(
                    onTap: ()=> Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=> const DadosCadastrais())),
                      child: const Text("Dados cadastrais")),
                  const SizedBox(height: 30),
                  const Divider(color: Colors.white,),
                  const Text("Termos de uso e privacidade"),
                  const SizedBox(height: 30),
                  const Divider(color: Colors.white,),
                  const Text("Configurações"),
                  const SizedBox(height: 30),
                  const Divider(color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (_)=> setState(() {
            currentIndex = _;
          }),
          scrollDirection: Axis.vertical,
          children: const [
            Page1(),
            Page2(),
            Page3()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (_)=> pageController.jumpToPage(_),
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
