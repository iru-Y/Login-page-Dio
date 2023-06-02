import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page_dio/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'my_app.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({Key? key}) : super(key: key);

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {

  late SharedPreferences _storage;

  TextEditingController _nomeUsuarioController = TextEditingController();
  TextEditingController _alturaController = TextEditingController();
  bool _receberNoticacao = false;
  bool _modoEscuro = false;

  final String _CHAVE_NOME_USUARIO = "CHAVE_NOME_USUARIO";
  final String _CHAVE_ALTURA = "CHAVE_ALTURA";
  final String _CHAVE_MODO_DARK = "CHAVE_MODO_DARK";
  final String _CHAVE_RECEBER_NOTICACOES = "CHAVE_RECEBER_NOTICACOES";

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() async {
    _storage = await SharedPreferences.getInstance();
    setState(() {
      _nomeUsuarioController.text = _storage.getString(_CHAVE_NOME_USUARIO) ?? "";
      _alturaController.text = (_storage.getDouble(_CHAVE_ALTURA) ?? 0).toString();
      _receberNoticacao = _storage.getBool(_CHAVE_RECEBER_NOTICACOES) ?? false;
      _modoEscuro = _storage.getBool(_CHAVE_MODO_DARK) ?? false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: MediaQuery.of(context).size.width,
         leading: Row(
            children: [
              IconButton(
                  onPressed: ()=> Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_)=> MainPage())
                  ),
                  icon: const Icon(Icons.arrow_back),
                  style: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.white)),
              ),
              const Text("Configurações"),
            ],
          ),
        ),
        body: ListView(
          children: [
              TextField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(hintText: "Nome do usuário", prefixIcon: Icon(Icons.person)),
                controller: _nomeUsuarioController,
              ),
              TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}$')),
                ],

                controller: _alturaController,
                decoration: const InputDecoration(hintText: "Altura", prefixIcon: Icon(Icons.height)),
              ),
               SwitchListTile(
                  activeTrackColor: Theme.of(context).colorScheme.primary,
                   title: Text("Deseja receber notificações?" , style: TextStyle(color: Colors.black)),
                onChanged: (_) {

                setState(() {
                  _storage.setBool(_CHAVE_RECEBER_NOTICACOES, _receberNoticacao);
                  _receberNoticacao = !_receberNoticacao;
                });
              },
                   value: _receberNoticacao
               ),
            SwitchListTile(
                activeTrackColor: Theme.of(context).colorScheme.primary,
                title: Text("Tema escuro" , style: TextStyle(color: Colors.black)),
                onChanged: (_) {
                  setState(() {
                    _modoEscuro = !_modoEscuro;
                  });
                },
                value: _modoEscuro),
            TextButton(onPressed: () async{
             await _storage.setString(_CHAVE_NOME_USUARIO, _nomeUsuarioController.text);
             await _storage.setDouble(_CHAVE_ALTURA, double.tryParse(_alturaController.text) ?? 0);
             await _storage.setBool(_CHAVE_RECEBER_NOTICACOES, _receberNoticacao);
             await _storage.setBool(_CHAVE_MODO_DARK, _modoEscuro);
             Navigator.pushReplacement(context,
                 MaterialPageRoute(builder: (_)=> MainPage()));
            }, child: const Text("Salvar"))
          ],
        )));
  }
}
