import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CustomShapeClipper_detail.dart';
import 'models/pregunta_model.dart';
import 'providers/preguntas_provider.dart';

class PreguntasRespuestasPage extends StatefulWidget {

  String ls ;
  PreguntasRespuestasPage({Key key, @required this.ls}) : super(key: key);

  @override
  _PreguntasRespuestasPageState createState() => _PreguntasRespuestasPageState();
}

class _PreguntasRespuestasPageState extends State<PreguntasRespuestasPage> {
  bool _isInit = true;

  List<Pregunta> preguntas =[];

  List<Pregunta> filteredPreguntas=[];

  List<String> lsSubCategorias = new List<String>();
  
  List<String> lsSubCategorias2 = new List<String>();

  @override
  void didChangeDependencies() async {
 
    if (_isInit) {
      preguntas = await PreguntasProvider().getPreguntas();
      if (preguntas.length > 0) { ///Permite ejecutar solo cuando tiene preguntas del provider
        filteredPreguntas = preguntas
            .where((pregunta) =>
                pregunta.subCategoria == widget.ls.toLowerCase())
            .toList();
        if (filteredPreguntas != null && filteredPreguntas.length > 0) {
          ///Imprime las categorias de las preguntas que resultaron del filtro
          
          List<String> lsTemp = new List<String>();
          List<String> lsTemp2 = new List<String>();
          
          filteredPreguntas.forEach((p) {
            
            lsTemp.add(p.pregunta);
            lsTemp2.add(p.respuesta);

            print(lsTemp2);
          });
          

          setState(() {
            lsTemp = Set.of(lsTemp).toList();
            lsTemp2 = Set.of(lsTemp2).toList();
            
            lsSubCategorias2 =lsTemp2;
            lsSubCategorias= lsTemp;//Aqui eliminar los duplicados
          });

        } else {
          print('Sin resultados');
        }
      }else{
        print('No existen preguntas');
      }
    }
    _isInit = false;
     super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<String> lsTemp2=this.lsSubCategorias2;
        return Scaffold(

              body: Stack(
                children: <Widget>[
                    ClipPath(
                      clipper: CustomShapeClipperDetail(),
                            child: Row(
                                  children:<Widget>[

                                    Container(
                                      child:  FlatButton(
                                                  color: Color.fromRGBO(232, 232, 232, 1),
                                                  onPressed: () => Navigator.pop(context, false),
                                                  child: Icon(
                                                    Icons.arrow_back_ios,
                                                    color: Color.fromRGBO(0, 0, 0, 0.4),
                                                    size: 35.0,
                                      ),
                                    ),
                                      
                                      height: 150.0, color: Color.fromRGBO(232, 232, 232, 1)
                                      ),
                                      Flexible(
                                          child: Padding(
                                          padding:EdgeInsets.only(left:25.0, right: 5),
                                          child: Text(widget.ls.toUpperCase(),
                                          //  overflow: TextOverflow.ellipsis,
                                          //  maxLines: 2,

                                            style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(0, 36, 65, 1),
                                            ),
                                          
                                          ),
                                        ),
                                      ),
                                   
                                  ]
                            )
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 150, 8, 1),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredPreguntas.length,
                        itemBuilder: (context , index){
                          return Dismissible(
                            key:ValueKey(filteredPreguntas[index]),
                            onDismissed: (direction){
                                  setState(() {
                                    filteredPreguntas.removeAt(index);
                                  });
                                },
                                background: Container(
                                  color:Color.fromRGBO(39, 84, 186, 1),
                                ),
                                                      child: Card(
                                      elevation: 8.0,
                                      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                                      child: Container(
                                        decoration: BoxDecoration(color: Colors.white),
                                        child: ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20.0,
                              vertical: 10.0
                            ),
                            leading: Container(
                              child: Container(
                                width: 40,
                                padding: EdgeInsets.only(right: 12.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(width: 1.0, color: Colors.grey[300])
                                  )
                                ),
                                child: Icon(Icons.art_track),
                                //alignment: Alignment.centerLeft,
                              ),
                            ),

                            title: Text(
                              lsSubCategorias[index],
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          
                            subtitle: Text(lsTemp2[index]),

                            trailing:
                              GestureDetector(
                                
                                child: Icon(Icons.content_copy, color: Colors.grey, size: 20.0),
                                onTap: () {
                                  Clipboard.setData(new ClipboardData(text: lsSubCategorias[index]+lsTemp2[index]));
                                          },
                                          ),
                                      onTap: () {
                                        //goToUnitMapScreen(context, unit);
                                      },
                                    ),
                                      ),
                                    ),
                                              );
                                
                                            },
                        
                      ),
                    ),

                       ],
                     ),
               );
             }
}
           
 