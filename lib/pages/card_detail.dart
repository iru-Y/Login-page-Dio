import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_page_dio/pages/card_page.dart';
import 'package:login_page_dio/pages/main_page.dart';

import '../model/card_detail_model.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({Key? key}) : super(key: key);

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {

  var _cardDetailModel = CardDetailModel(
      1,
      "Meu Card",
      "assets/images/dio_logo.svg",
      "Por outro lado, a hegemonia do ambiente político estimula a padronização das direções preferenciais no sentido do progresso. Do mesmo modo, a determinação clara de objetivos não pode mais se dissociar do sistema de formação de quadros que corresponde às necessidades. A certificação de metodologias que nos auxiliam a lidar com a complexidade dos estudos efetuados apresenta tendências no sentido de aprovar a manutenção do sistema de participação geral."
  );

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _cardDetailModel.id,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.03),
            child:
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: ()=> Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_)=> const MainPage())),
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.3,
                        child: SvgPicture.asset(_cardDetailModel.pic)),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                    Text(_cardDetailModel.title, style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.05)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Expanded(
                      child: Text(_cardDetailModel.text,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),

            ),
          ),
      ),
    );
  }
}
