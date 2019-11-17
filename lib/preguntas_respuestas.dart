import 'package:flutter/material.dart';

import 'CustomShapeClipper_detail.dart';
import 'models/pregunta_model.dart';
import 'providers/preguntas_provider.dart';

class PreguntasRespuestasPage extends StatelessWidget {

  String ls ;
  PreguntasRespuestasPage({Key key, @required this.ls}) : super(key: key);

String nombreCategoria;
  bool _isInit = true;
  List<Pregunta> preguntas;
  List<Pregunta> filteredPreguntas;
  List<String> lsSubCategorias = new List<String>();

  // void initState() {
  //   super.initState();
  //   lsSubCategorias.add("...");
  // }

  @override
  void didChangeDependencies() async {
    //  nombreCategoria = ModalRoute.of(context).settings.arguments;
     
    if (_isInit) {
      preguntas = await PreguntasProvider().getPreguntas();
      if (preguntas.length > 0) { ///Permite ejecutar solo cuando tiene preguntas del provider
        filteredPreguntas = preguntas
            .where((pregunta) =>
                pregunta.subCategoria == ls.toLowerCase())
            .toList();
        if (filteredPreguntas != null && filteredPreguntas.length > 0) {
          ///Imprime las categorias de las preguntas que resultaron del filtro
          
          List<String> lsTemp = new List<String>();
          
          filteredPreguntas.forEach((p) {
            
            lsTemp.add(p.pregunta+p.respuesta);

            print(p.subCategoria);
          });

          // setState(() {
          //   lsTemp = Set.of(lsTemp).toList();
          //   lsSubCategorias= lsTemp;//Aqui eliminar los duplicados
          // });

        } else {
          print('Sin resultados');
        }
      }else{
        print('No existen preguntas');
      }
    }
    _isInit = false;
    // super.didChangeDependencies();
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
                       SingleChildScrollView(
                         child: Column(
                           children: <Widget>[
                             Container(
                               child: Padding(
                                 padding:
                                     EdgeInsets.symmetric(horizontal: 5.0, vertical: 55.0),
                                 child: Row(
                                   children: <Widget>[
                                     //Padding(padding:EdgeInsets.symmetric(horizontal: 7.0 , vertical: 14.0) ,),
                                     FlatButton(
                                       color: Color.fromRGBO(232, 232, 232, 1),
                                       onPressed: () => Navigator.pop(context, false),
                                       child: Icon(
                                         Icons.arrow_back_ios,
                                         color: Color.fromRGBO(0, 0, 0, 0.4),
                                         size: 35.0,
                                       ),
                                     ),
                                     Align(
                                       alignment: Alignment.topLeft,
                                       child: Padding(
                                         padding: const EdgeInsets.all(1.0),
                                         child: Column(children: <Widget>[
                                           Padding(
                                             padding: const EdgeInsets.only(left: 18.0),
                                             child: Align(
                                               alignment: Alignment.centerLeft,
                                               child: Text(
                                                 ls,///Se reemplaza por el valor existente en el inicio del build.
                                                 style: TextStyle(
                                                   fontSize: 25.0,
                                                   fontWeight: FontWeight.bold,
                                                   color: Color.fromRGBO(0, 36, 65, 1),
                                                 ),
                                               ),
                                             ),
                                           ),
                                         ]),
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
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
                           filteredPreguntas[index].pregunta,
                           style: TextStyle(
                             fontSize:   20,
                             fontWeight:  FontWeight.bold
                                 ,
                           ),
                         ),
                         subtitle: Text('Respuesta'),
                         leading: 
                              Icon(Icons.question_answer)
                             ,
                         trailing: 
                              Icon(Icons.arrow_right),
                         onTap: () {
                          print('presionado');
                         }),
                   ),
                 ),
             Text('Hola')
                             //Padding(padding: EdgeInsets.symmetric(vertical: 400.0 )),
                           ],
                         ),
                       ),
                     ],
                   ),
                 );
  }
}