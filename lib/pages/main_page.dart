import 'package:flutter/material.dart';
import 'package:login_page_dio/pages/dados_cadastrais.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  InkWell(
                    onTap: ()=> Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context)=> DadosCadastrais())),
                      child: Text("Dados cadastrais")),
                  SizedBox(height: 30),
                  Text("Termos de uso e privacidade"),
                  SizedBox(height: 30),
                  Text("Configurações")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
