import 'package:flutter/material.dart';
import 'package:login_page_dio/pages/main_page.dart';
import 'package:login_page_dio/repositories/nivel_exp_repository.dart';
import 'package:login_page_dio/repositories/linguagens_repository.dart';

import '../shared/text_field_style.dart';
import '../shared/text_label.dart';

class DadosCadastrais extends StatefulWidget {
  const DadosCadastrais({Key? key}) : super(key: key);

  @override
  State<DadosCadastrais> createState() => _DadosCadastraisState();
}

class _DadosCadastraisState extends State<DadosCadastrais> {

  TextEditingController nomeController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  DateTime? dateNascimento;
  var nivelExp = NivelExpRepository();
  var niveis =[];
  var nivelSelecionado = "";
  var linguagensRepository = LinguagensRepository();
  var linguagens = [];
  var linguagemSelecionada = [];

  @override
  void initState() {
    niveis = nivelExp.selecionaNivel();
    linguagens = linguagensRepository.retornaLinguagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white30,
      appBar: AppBar(
        leadingWidth: MediaQuery.of(context).size.width,
        leading: SingleChildScrollView(
          child: Row(
            children: [
              IconButton(onPressed: ()=> Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context)=> const MainPage())),
                  icon: const Icon(Icons.arrow_back)),
              SizedBox(width: MediaQuery.of(context).size.height * 0.020),
              const Text("Dados Cadastrais")
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: MediaQuery.of(context).size.width * 0.016),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextLabel(text: "Nome",),
              TextFieldStyle(textController: nomeController),
              const TextLabel(text: "Data de nascimento"),
              TextField(
                style: const TextStyle(
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
              const TextLabel(text: "Nível de experiência"),
              Column(
                children: niveis
                    .map((_) => RadioListTile(
                  dense: true,
                    title: Text(_),
                    selected: nivelSelecionado == _,
                    value: niveis,
                    groupValue: _,
                    onChanged: (_){
                    setState(() {
                      nivelSelecionado = _.toString();
                    });
                    }
                )).toList(),
              ),
              const TextLabel(text: "Linguagens preferidas"),
              Column(
                  children: linguagens
                      .map((_) => CheckboxListTile(
                    dense: true,
                  activeColor: Colors.black,
                  title: Text(_),
                  value: linguagemSelecionada.contains(_),
                  onChanged: (bool? value){
                    if (value!){
                    setState(() {
                      linguagemSelecionada.add(_);
                    });
                      }else{setState(() {
                      linguagemSelecionada.remove(_);
                    });
                      }

                  }),).toList()),
              TextButton(
                  onPressed: () {

                  },
                  child: const Text("Salvar")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
