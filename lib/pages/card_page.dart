import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_page_dio/model/card_detail_model.dart';
import 'package:login_page_dio/pages/card_detail.dart';
import 'package:login_page_dio/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetailModel? cardDetailModel;

  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async{
    cardDetailModel = await cardDetailRepository.get();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        cardDetailModel == null ? SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
          child: const LinearProgressIndicator(
          ),
        ) :
        SizedBox(
          width: double.infinity,
          child: Hero(
            tag: cardDetailModel!.id,
            child: Card(
                margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
               elevation: 8,
                shadowColor: Theme.of(context).colorScheme.primary,
                child: Padding(
                  padding: EdgeInsets.all( MediaQuery.of(context).size.width * 0.03),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                              height: MediaQuery.of(context).size.width * 0.08,
                              child: SvgPicture.asset(cardDetailModel!.pic)),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                          Text(cardDetailModel!.title, style: TextStyle(
                              color: Colors.black,
                              fontSize: MediaQuery.of(context).size.width * 0.05)),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Text(cardDetailModel!.text,
                      style: const TextStyle(color: Colors.black),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(onPressed: ()=> Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_)=> const CardDetail())),
                            style: ButtonStyle(elevation: MaterialStateProperty.all(0.8),
                            backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.primary)),
                            child: const Text("Ler mais", style: TextStyle(color: Colors.white)
                        ),
                      )),
                    ],
                  ),
                ),
              ),
          ),
          ),
      ],
    );
  }
}
