import 'package:login_page_dio/model/card_detail_model.dart';

class CardDetailRepository {

  Future<CardDetailModel> get() async{
    await Future.delayed(const Duration(seconds: 5));
    return CardDetailModel(
        1,
        "Meu Card",
        "assets/images/dio_logo.svg",
        "Por outro lado, a hegemonia do ambiente político estimula a padronização das direções preferenciais no sentido do progresso. Do mesmo modo, a determinação clara de objetivos não pode mais se dissociar do sistema de formação de quadros que corresponde às necessidades. A certificação de metodologias que nos auxiliam a lidar com a complexidade dos estudos efetuados apresenta tendências no sentido de aprovar a manutenção do sistema de participação geral."
    );
  }
}