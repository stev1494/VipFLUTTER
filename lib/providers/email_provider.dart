import 'dart:convert';

import 'package:app_vip/models/email_model.dart';
import 'package:http/http.dart' as http;

class EmailProvider {

  Future<List<Email>> getEmails(String correo , String mensaje ) async {
    // final url = Uri.http(_url, '/api/preguntas/');

    final resp = await http.get('http://167.172.250.147:3400/email/$correo/$mensaje');

    List<Email> emails = [];
    if (resp.statusCode == 200) {
      print("Respuesta de servicio con status:${resp.statusCode}");

      final decodedData = json.decode(resp.body);

      emails.addAll(Emails.fromJsonList(decodedData).items);
    }else{
      print("Respuesta de servicio con status:${resp.statusCode}");
    }

    return emails;
  }
}