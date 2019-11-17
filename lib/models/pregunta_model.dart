class Preguntas {

  List <Pregunta> items = new List();
  Preguntas();

  Preguntas.fromJsonList( List<dynamic> jsonList){

    if ( jsonList == null ) return ;

    for ( var item in jsonList ){
      final pregunta = new Pregunta.fromJson(item);
      items.add(pregunta);
    }

  }


}



class Pregunta {
  int idPregunta;
  String categoria;
  String subCategoria;
  String pregunta;
  String respuesta;

  Pregunta(
      {this.idPregunta,
      this.categoria,
      this.subCategoria,
      this.pregunta,
      this.respuesta});

  Pregunta.fromJson(Map<String, dynamic> json) {
    idPregunta = json['IdPregunta'];
    categoria = json['Categoria'];
    subCategoria = json['SubCategoria'];
    pregunta = json['Pregunta'];
    respuesta = json['Respuesta'];
  }

 

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdPregunta'] = this.idPregunta;
    data['Categoria'] = this.categoria;
    data['SubCategoria'] = this.subCategoria;
    data['Pregunta'] = this.pregunta;
    data['Respuesta'] = this.respuesta;
    return data;
  }
}