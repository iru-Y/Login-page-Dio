import 'package:flutter/material.dart';
import 'package:login_page_dio/pages/main_page.dart';

import '../shared/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({Key? key}) : super(key: key);

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {

  var nomeController = TextEditingController();
  var dataNascimentoController = TextEditingController();
  DateTime? dateNascimento;

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
                  MaterialPageRoute(builder: (context)=> const MainPage())),
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(width: 20),
              const Text("Dados Cadastrais")
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.012,
            horizontal: MediaQuery.of(context).size.width * 0.016),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextLabel(text: "Nome",),
            TextField(
              controller: nomeController,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            const TextLabel(text: "Data de nascimento"),
            TextField(

              style: TextStyle(
                color: Colors.black,
              ),
              readOnly: true,
              controller: dataNascimentoController,
              onTap: () async {
               var data = await showDatePicker(context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900, 1, 1),
                    lastDate: DateTime.now()
                );
               if(data != null){
                 dataNascimentoController.text = data.toString();
                 dateNascimento = data;
               }
              },
            ),
            TextButton(
                onPressed: ()=> {},
                child: const Text("Salvar")
            ),
          ],
        ),
      ),
    );
  }
}
