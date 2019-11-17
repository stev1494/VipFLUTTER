import 'package:flutter/material.dart';

class CategoriasPage extends StatefulWidget {
  CategoriasPage({Key key}) : super(key: key);

  _CategoriasPageState createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  String categoria;

  @override
  Widget build(BuildContext context) {
    final title = 'Especialidades';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.white,

          title: Text(title,
          style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(0, 36, 65, 1),
            ),)
          ,

        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GridView.count(
            // Crea una grid con 2 columnas. Si cambias el scrollDirection a
            // horizontal, esto produciría 2 filas.
            crossAxisCount: 2,
            children: List.generate(14, (index) {
              return Padding(
                padding: const EdgeInsets.all( 7.0),
                child: GestureDetector(
                  onTap: () => _changeCell(index),
                  child: listaCategorias(context, index )
                ),
              );
            }),
          ),
        ),
      ),
    );
  }


 _changeCell(index) {
    setState(() {
      if( index == 0){
      this.categoria = "Aduanero";
    }else if(index == 1){
      this.categoria = "Ambiental";
    }else if(index == 2){
      this.categoria = "Civil";
    }else if(index == 3){
      this.categoria = "Comercio";
    }else if(index == 4){
      this.categoria = "Constitucional";
    }else if(index == 5){
      this.categoria = "Empresarial";
    }else if(index == 6){
      this.categoria = "Inquilinato";
    }else if(index == 7){
      this.categoria = "Laboral";
    }else if(index == 8){
      this.categoria = "Niñez";
    }else if(index == 9){
      this.categoria = "Penal";
    }else if(index == 10){
      this.categoria = "Propiedad Intelectual";
    }else if(index == 11){
      this.categoria = "Sede Administrativa";
    }else if(index == 12){
      this.categoria = "Transito";
    }else if(index == 13){
      this.categoria = "Tributario";
    }
    
    Navigator.pushNamed(context, '/cliper', arguments: this.categoria );

    });
    print("Container clicked " + index.toString());
  }


  String _changeCategory( index){

    setState(() {
      //String categoria = '';

    if( index == 0){
      this.categoria = "Aduanero";
    }else if(index == 1){
      this.categoria = "Ambiental";
    }else if(index == 2){
      this.categoria = "Civil";
    }else if(index == 3){
      this.categoria = "Comercio";
    }else if(index == 4){
      this.categoria = "Constitucional";
    }else if(index == 5){
      this.categoria = "Empresarial";
    }else if(index == 6){
      this.categoria = "Inquilinato";
    }else if(index == 7){
      this.categoria = "Laboral";
    }else if(index == 8){
      this.categoria = "Niñez";
    }else if(index == 9){
      this.categoria = "Penal";
    }else if(index == 10){
      this.categoria = "Propiedad Intelectual";
    }else if(index == 11){
      this.categoria = "Sede Administrativa";
    }else if(index == 12){
      this.categoria = "Transito";
    }else if(index == 13){
      this.categoria = "Tributario";
    }
      
      
    });
    return this.categoria;
  } 




  Widget listaCategorias( BuildContext context , index ){
    String imagen;
    String cat = _changeCategory(index);
    if( index == 0){
      imagen="icon-aduanero";
    }else if(index == 1){
      imagen="icon-ambiental";
    }else if(index == 2){
      imagen="icon-civil";
    }else if(index == 3){
      imagen="icon-comercio";
    }else if(index == 4){
      imagen="icon-constitucional";
    }else if(index == 5){
      imagen="icon-empresarial";
    }else if(index == 6){
      imagen="icon-inquilinato";
    }else if(index == 7){
      imagen="icon-laboral";
    }else if(index == 8){
      imagen="icon-ninez";
    }else if(index == 9){
      imagen="icon-penal";
    }else if(index == 10){
      imagen="icon-propiedad-intelectual";
    }else if(index == 11){
      imagen="icon-sede-administrativa";
    }else if(index == 12){
      imagen="icon-transito";
    }else if(index == 13){
      imagen="icon-tributario";
    }
    

    return  Column(
          children:<Widget>[
            RaisedButton(
              hoverElevation: 60.0,
              autofocus: true ,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              hoverColor: Color.fromRGBO(0, 36, 65, 1),
              elevation: 1.0,
              focusElevation: 2.0,
              disabledElevation: 10.0,
              

          // onPressed: () { Navigator.pushNamed(context, '/login'); },
                onPressed: () { _changeCell(index); },
                  child: Image.asset("images/$imagen.png",
                        width : 50,
                        height: 50,
                        fit   : BoxFit.cover,
                  ),

                color: Color.fromRGBO(232, 232, 232, 1),
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
            ),
      Padding(
        padding: const EdgeInsets.all(7.0),
        child: Text("$cat")
        
      ),
           
          ]

    );

  }
}