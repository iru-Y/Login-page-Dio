import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_page_dio/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RandomNumberPage extends StatefulWidget {
  const RandomNumberPage({Key? key}) : super(key: key);

  @override
  State<RandomNumberPage> createState() => _RandomNumberPageState();
}

class _RandomNumberPageState extends State<RandomNumberPage> {
  int? numeroGerado = 0;
  final String CHAVE_NUMERO_GERADO = "numeros_aleatorios";

  @override
  void initState() {
    carregarDados();
    super.initState();
  }

  void carregarDados () async{
    final storage = await SharedPreferences.getInstance();
    setState(() {
      numeroGerado = storage.getInt(CHAVE_NUMERO_GERADO);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gerador de números aleatórios"),
        ),
      body: Wrap(
        children: [
          IconButton(
            onPressed: ()=> Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_)=> const MainPage())),
            icon: const Icon(Icons.close),
          ),
          Center(
            child: Text("$numeroGerado",
            style: TextStyle(color: Colors.black)),
            ),
        ],
      ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: const Icon(Icons.add),
          onPressed:() async{
            final storage = await SharedPreferences.getInstance();
            var random = Random();
            setState(() {
              numeroGerado = random.nextInt(1000);
            });
            storage.setInt(CHAVE_NUMERO_GERADO, numeroGerado!);
          } ,
        
        ),
      ),
    );
  }
}
