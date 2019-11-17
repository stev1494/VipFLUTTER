import 'package:flutter/material.dart';

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
            
            // lsSubCategorias2 =lsTemp2;
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
    return Scaffold(
          body: Stack(
            children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipperDetail(),
                        child: Container(
                        height: 150.0, color: Color.fromRGBO(232, 232, 232, 1)),
                ),

                ListView.separated(
                                          
                    separatorBuilder: (context, index) => Divider(
                        color: Colors.black,
                    ),
                    itemCount: filteredPreguntas.length,
                    itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                       dense: true,
                        title: Text(
                          lsSubCategorias[index],
                          style: TextStyle(
                            fontSize:   20,
                            fontWeight:  FontWeight.bold
                                            ,
                          ),
                        ),
                       subtitle: Text(lsTemp2[index]),
                       leading:  Icon(Icons.question_answer),
                       trailing: Icon(Icons.arrow_right),
                        onTap: () {
                                      print('presionado');
                        }
                     ),
                     ),
                ),
                            


                // SingleChildScrollView(
                //     child: Column(
                //            children: <Widget>[
                //              Container(
                //                child: Padding(
                //                  padding:
                //                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 55.0),
                //                  child: Row(
                //                    children: <Widget>[
                //                      //Padding(padding:EdgeInsets.symmetric(horizontal: 7.0 , vertical: 14.0) ,),
                //                      FlatButton(
                //                        color: Color.fromRGBO(232, 232, 232, 1),
                //                        onPressed: () => Navigator.pop(context, false),
                //                        child: Icon(
                //                          Icons.arrow_back_ios,
                //                          color: Color.fromRGBO(0, 0, 0, 0.4),
                //                          size: 35.0,
                //                        ),
                //                      ),
                //                      Align(
                //                        alignment: Alignment.topLeft,
                //                        child: Padding(
                //                          padding: const EdgeInsets.all(1.0),
                //                          child: Column(children: <Widget>[
                //                            Padding(
                //                              padding: const EdgeInsets.only(left: 18.0),
                //                              child: Align(
                //                                alignment: Alignment.centerLeft,
                //                                child: Text(
                //                                  widget.ls,///Se reemplaza por el valor existente en el inicio del build.
                //                                  style: TextStyle(
                //                                    fontSize: 25.0,
                //                                    fontWeight: FontWeight.bold,
                //                                    color: Color.fromRGBO(0, 36, 65, 1),
                //                                  ),
                //                                ),
                //                              ),
                //                            ),
                //                          ]),
                //                        ),
                //                      ),
                //                    ],
                //                  ),
                //                ),
                //              ),
                            
            
                //              //Padding(padding: EdgeInsets.symmetric(vertical: 400.0 )),
                //            ],
                //    ),
                // ),
            ],
          ),
    );
  }
}