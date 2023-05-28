import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page_dio/pages/login_page.dart';
import 'package:login_page_dio/pages/main_page.dart';

import '../pages/dados_cadastrais.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _sizedBoxColumnDrawer = MediaQuery.of(context).size.height * 0.03;

    return  Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             UserAccountsDrawerHeader(
               decoration: const BoxDecoration(
                 border: Border(bottom: BorderSide(color: Colors.white)),
                 color: Colors.orange
               ),
                currentAccountPicture: InkWell(
                  onTap: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (_) => DecoratedBox(
                          decoration: const BoxDecoration(color: Colors.orange),
                          child: Wrap(
                            children: [
                              ListTile(
                                onTap: ()=> Navigator.pop(_),
                                title: const Text("câmera"),
                                leading: const Icon(Icons.camera, color: Colors.white,),
                              ),
                              ListTile(
                                onTap: ()=> Navigator.pop(_),
                                title: const Text("galeria"),
                                leading: const Icon(Icons.photo, color: Colors.white,),
                              )
                            ],
                          ),
                        ),
                    );
                  },
                  child: const CircleAvatar(
                      backgroundColor: Colors.blue,
                   backgroundImage: AssetImage("assets/images/profile/account_picture.jpg"),
                  ),
                ),
                accountName: const Text("pistoled999"),
                accountEmail: const Text("yuri_matteus@hotmail.com")
            ),
            Row(
              children: [
                const Icon(Icons.person,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: ()=> Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context)=> const DadosCadastrais())),
                      child: const Text("Dados cadastrais")),
                ),
              ],
            ),
            SizedBox(height: _sizedBoxColumnDrawer),
            const Divider(color: Colors.white),
            InkWell(
              onTap: (){showModalBottomSheet(context: context,
                  shape:  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  builder: (_)=> const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.orange),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          " É claro que o entendimento das metas propostas obstaculiza a apreciação da importância dos métodos utilizados na avaliação de resultados. O incentivo ao avanço tecnológico, assim como a mobilidade dos capitais internacionais assume importantes posições no estabelecimento das condições financeiras e administrativas exigidas. Percebemos, cada vez mais, que o aumento do diálogo entre os diferentes setores produtivos exige a precisão e a definição das formas de ação.",
                      style: TextStyle(
                        fontSize: 18
                      )),
                    ),
                  )
              );},
              child: const Row(
                children: [
                  Icon(Icons.info,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Termos de uso e privacidade"),
                  ),
                ],
              ),
            ),
            SizedBox(height: _sizedBoxColumnDrawer),
            const Divider(color: Colors.white),
            const Row(
              children: [
                Icon(Icons.settings, color: Colors.white,),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Configurações"),
                ),
              ],
            ),
            SizedBox(height: _sizedBoxColumnDrawer),
            const Divider(color: Colors.white),
            InkWell(
              onTap: ()=> showDialog(
                  context: context,
                  builder: (_)=> AlertDialog(
                    elevation: 8,
                    backgroundColor: Colors.orange,
                  title: Text("Deseja realmente sair do aplicativo?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    content: Wrap(
                      children: [
                        Text("Você ira sair do aplicativo!"),
                        Text("Deseja realmente sair?"),
                      ],
                    ),
                    actions: [
                      TextButton(onPressed: ()=> Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_)=>LoginPage())),
                          child: Text("Sim")),
                      TextButton(onPressed: ()=> Navigator.of(context).pop(),
                          child: Text("Não"))
                    ],
                    ),
                  ),
              child: Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Sair"),
                  ),
                ],
              ),
            ),
            SizedBox(height: _sizedBoxColumnDrawer),
            const Divider(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
