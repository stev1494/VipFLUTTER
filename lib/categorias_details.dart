import 'package:app_vip/categorias.dart';
import 'package:app_vip/preguntas_respuestas.dart';
import 'package:flutter/material.dart';
import 'package:app_vip/CustomShapeClipper_detail.dart';

import 'models/pregunta_model.dart';
import 'providers/preguntas_provider.dart';

class CategoriaDetalle extends StatefulWidget {
  @override
  _CategoriaDetalleState createState() => _CategoriaDetalleState();
}

class _CategoriaDetalleState extends State<CategoriaDetalle> {
  String nombreCategoria;
  bool _isInit = true;
  List<Pregunta> preguntas;
  List<Pregunta> filteredPreguntas;
  List<String> lsSubCategorias = new List<String>();

  void initState() {
    super.initState();
    
    // lsSubCategorias.add("...");
  }

  @override
  void didChangeDependencies() async {
     nombreCategoria = ModalRoute.of(context).settings.arguments;
    if (_isInit) {
       preguntas= await PreguntasProvider().getPreguntas();
      if (preguntas.length > 0) { ///Permite ejecutar solo cuando tiene preguntas del provider
        filteredPreguntas = preguntas
            .where((pregunta) =>
                pregunta.categoria == nombreCategoria.toLowerCase())
            .toList();
        if (filteredPreguntas != null && filteredPreguntas.length > 0) {
          ///Imprime las categorias de las preguntas que resultaron del filtro
          
          List<String> lsTemp = new List<String>();
          
          filteredPreguntas.forEach((p) {
            
            lsTemp.add(p.subCategoria);

            print(p.subCategoria);
          });

          setState(() {
            lsTemp = Set.of(lsTemp).toList();
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
    String categoria;
    if (filteredPreguntas != null && filteredPreguntas.length > 0) {
      /// solamente se ejecuta si tiene al menos un valor en el arreglo
      categoria = filteredPreguntas[0].categoria;
    } else {
      /// Valor para el caso que el arreglo este vacio.
      categoria = 'Sin Categoria';
    }

return Scaffold(
  body:Stack(children: <Widget>[


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
                                          child: Text(nombreCategoria.toUpperCase(),
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
        itemCount: lsSubCategorias.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(1.0),
          child: ListTile(
            dense: true,
              title: Text(
                
                lsSubCategorias[index].toUpperCase(),
                style: TextStyle(
                  fontSize:   15,
                  fontWeight:  FontWeight.bold
                      ,
                ),
              ),
              // subtitle: Text('Respuesta'),
              // leading: 
              //      Icon(Icons.question_answer)
              //     ,
              trailing: 
                   Icon(Icons.arrow_right),
                onTap: () {
                  
                   Navigator.push(context, new MaterialPageRoute(
                    builder: (context) =>
                      new PreguntasRespuestasPage(ls:lsSubCategorias[index]))
                    );
                  print('Aquì funciòn para mandar a llamar las preguntas de '+lsSubCategorias[index]);
                  fnPreguntasCategoria();
                }
            ),
                     ),
                   ),
    ), 
               




  ],)
  
  
  
  
  );
             
             //     return Scaffold(
             //       body: Stack(
             //         children: <Widget>[
             //           ClipPath(
             //             clipper: CustomShapeClipperDetail(),
             //             child: Container(
             //                 height: 150.0, color: Color.fromRGBO(232, 232, 232, 1)),
             //           ),
             //           SingleChildScrollView(
             //             child: Column(
             //               children: <Widget>[
             //                 Container(
             //                   child: Padding(
             //                     padding:
             //                         EdgeInsets.symmetric(horizontal: 5.0, vertical: 55.0),
             //                     child: Row(
             //                       children: <Widget>[
             //                         //Padding(padding:EdgeInsets.symmetric(horizontal: 7.0 , vertical: 14.0) ,),
             //                         FlatButton(
             //                           color: Color.fromRGBO(232, 232, 232, 1),
             //                           onPressed: () => Navigator.pop(context, false),
             //                           child: Icon(
             //                             Icons.arrow_back_ios,
             //                             color: Color.fromRGBO(0, 0, 0, 0.4),
             //                             size: 35.0,
             //                           ),
             //                         ),
             //                         Align(
             //                           alignment: Alignment.topLeft,
             //                           child: Padding(
             //                             padding: const EdgeInsets.all(1.0),
             //                             child: Column(children: <Widget>[
             //                               Padding(
             //                                 padding: const EdgeInsets.only(left: 18.0),
             //                                 child: Align(
             //                                   alignment: Alignment.centerLeft,
             //                                   child: Text(
             //                                     nombreCategoria,///Se reemplaza por el valor existente en el inicio del build.
             //                                     style: TextStyle(
             //                                       fontSize: 25.0,
             //                                       fontWeight: FontWeight.bold,
             //                                       color: Color.fromRGBO(0, 36, 65, 1),
             //                                     ),
             //                                   ),
             //                                 ),
             //                               ),
             //                             ]),
             //                           ),
             //                         ),
             //                       ],
             //                     ),
             //                   ),
             //                 ),
             //     //             ListView.separated(
                               
             //     //   separatorBuilder: (context, index) => Divider(
             //     //     color: Colors.black,
             //     //   ),
             //     //   itemCount: filteredPreguntas.length,
             //     //   itemBuilder: (context, index) => Padding(
             //     //     padding: EdgeInsets.all(8.0),
             //     //     child: ListTile(
             //     //       dense: true,
             //     //         title: Text(
             //     //           filteredPreguntas[index].pregunta,
             //     //           style: TextStyle(
             //     //             fontSize:   20,
             //     //             fontWeight:  FontWeight.bold
             //     //                 ,
             //     //           ),
             //     //         ),
             //     //         subtitle: Text('Respuesta'),
             //     //         leading: 
             //     //              Icon(Icons.question_answer)
             //     //             ,
             //     //         trailing: 
             //     //              Icon(Icons.arrow_right),
             //     //         onTap: () {
             //     //          print('presionado');
             //     //         }),
             //     //   ),
             //     // ),
             // Text('Hola')
             //                 //Padding(padding: EdgeInsets.symmetric(vertical: 400.0 )),
             //               ],
             //             ),
             //           ),
             //         ],
             //       ),
             //     );
               }
             
               void fnPreguntasCategoria() {
                 print('Imprimir nueva lista o redireccionar a otra pantalla con preguntas');
               }
}