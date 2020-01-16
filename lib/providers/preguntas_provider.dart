import 'dart:convert';

import 'package:app_vip/models/pregunta_model.dart';
import 'package:http/http.dart' as http;

class PreguntasProvider {
  // String _url  = 'http://b96a0821.ngrok.io';

  Future<List<Pregunta>> getPreguntas() async {
    // final url = Uri.http(_url, '/api/preguntas/');

    final resp = await http.get('http://159.203.118.11:5000/api/preguntas/');

    List<Pregunta> preguntas = [];
    if (resp.statusCode == 200) {
      print("Respuesta de servicio con status:${resp.statusCode}");

      final decodedData = json.decode(resp.body);

      preguntas.addAll(Preguntas.fromJsonList(decodedData).items);
    }else{
      print("Respuesta de servicio con status:${resp.statusCode}");
    }

    return preguntas;
  }
}