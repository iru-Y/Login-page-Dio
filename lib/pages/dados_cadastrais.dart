import 'package:flutter/material.dart';
import 'package:login_page_dio/pages/main_page.dart';

class DadosCadastrais extends StatelessWidget {
  const DadosCadastrais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
        leading: SingleChildScrollView(
          child: Row(
            children: [
              IconButton(onPressed: ()=> Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=> MainPage())),
                  icon: Icon(Icons.keyboard_return)),
              SizedBox(width: 20),
              Text("Dados Cadastrais")
            ],
          ),
        ),
      ),
      body: Center(child: Text("Dados Cadastrais", style: TextStyle(color: Colors.black),)),
    );
  }
}
