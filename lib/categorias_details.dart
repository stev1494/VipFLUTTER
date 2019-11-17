import 'package:app_vip/categorias.dart';
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

  @override
  void didChangeDependencies() async {
     nombreCategoria = ModalRoute.of(context).settings.arguments;
    if (_isInit) {
      preguntas = await PreguntasProvider().getPreguntas();
      if (preguntas.length > 0) { ///Permite ejecutar solo cuando tiene preguntas del provider
        filteredPreguntas = preguntas
            .where((pregunta) =>
                pregunta.categoria == nombreCategoria.toLowerCase())
            .toList();
        if (filteredPreguntas != null && filteredPreguntas.length > 0) {
          ///Imprime las categorias de las preguntas que resultaron del filtro
          filteredPreguntas.forEach((p) {
            print(p.subCategoria);
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
                                    nombreCategoria,///Se reemplaza por el valor existente en el inicio del build.
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

                //Padding(padding: EdgeInsets.symmetric(vertical: 400.0 )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}