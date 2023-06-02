import 'package:flutter/material.dart';
import 'package:login_page_dio/main_page.dart';
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
  double salarioEscolhido= 0;
  int tempoExperiencia = 0;
  bool salvar = false;

  List<DropdownMenuItem<int>> returnItens(_) {
    var itens = <DropdownMenuItem<int>>[];
    for (var i = 0; i <= _; i++) {
      itens.add(DropdownMenuItem(
        value: i,
        child: Text(i.toString()),
      ));
    }
    return itens;
  }



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
      body: salvar ? Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ) : SingleChildScrollView(
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
              children: niveis.map((_) => RadioListTile(
                dense: true,
                title: Text(_),
                selected: nivelSelecionado == _,
                value: _,
                groupValue: nivelSelecionado,
                onChanged: (_) {
                  setState(() {
                    nivelSelecionado = _;
                  });
                },
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
                      }else{
                      setState(() {
                      linguagemSelecionada.remove(_);
                    });
                      }
                  }),).toList()),
               TextLabel(text: "Pretenção salarial R\$ ${salarioEscolhido.round()}"),
              Slider(
                  min: 0,
                  max: 10000,
                  value: salarioEscolhido,
                  onChanged: (_){
                    setState(() {
                      salarioEscolhido = _;
                    });
                  }),
              const TextLabel(text: "Tempo de experiência"),
              DropdownButton(
                  dropdownColor: Theme.of(context).colorScheme.primary,
                  isDense: true,
                  value: tempoExperiencia,
                  items: returnItens(50),
                  onChanged: (_){
                    setState(() {
                      tempoExperiencia = int.parse(_.toString());
                    });
                  }),
              TextButton(
                  onPressed: () {
                    if(nomeController.text.length < 3){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Preencha o campo nome corretamente"))
                      );
                      return;
                    }
                    if(dateNascimento == null){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Preencha a data de nascimento"))
                      );
                      return;
                    }
                    if(dateNascimento == null){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Preencha a data de nascimento"))
                      );
                    }
                    setState(() {
                      salvar = true;
                    });
                    Future.delayed(const Duration(seconds: 2)); (){
                      setState(() {
                        salvar = false;
                      });
                    };
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
