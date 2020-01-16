class Emails {

  List <Email> items = new List();
  Emails();

  Emails.fromJsonList( List<dynamic> jsonList){

    if ( jsonList == null ) return ;

    for ( var item in jsonList ){
      final email = new Email.fromJson(item);
      items.add(email);
    }

  }


}



class Email {
    String nombre;
    String correo;
    String mensaje;

    Email({
        this.nombre,
        this.correo,
        this.mensaje,
    });

    factory Email.fromJson(Map<String, dynamic> json) => Email(
        nombre: json["nombre"],
        correo: json["correo"],
        mensaje: json["mensaje"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "correo": correo,
        "mensaje": mensaje,
    };
}