

import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infraestructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  //dio : es un paquete que nos sirve para hacer peticiones http de una forma facil
  final _dio = Dio();



  Future<Message> getYesNoAnswer() async {

    //Hago mi petción async
    final response = await _dio.get('https://yesno.wtf/api');

    //AutoMappeo mi respues a una entidad de tipo YesNoModel
    final yesNoModel = YesNoModel.fromJsonMap(response.data);
    //retorno la respuesta
    return yesNoModel.toMessageEntity();

  }
}