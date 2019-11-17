import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:app_vip/providers/preguntas_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'models/pregunta_model.dart';


class FleetScreen extends StatefulWidget {
  @override
  _FleetScreenState createState() => _FleetScreenState();
}

class _FleetScreenState extends State<FleetScreen> {


  // Unidades de rastreo filtradas
  List<Pregunta>duplicatedUnits = List<Pregunta>();
  // Unidades de rastreo
  List<Pregunta> units = List<Pregunta>();

  // BUSCADOR DE UNIDADES
  // Controlador del searchWidget
  TextEditingController controller = new TextEditingController();
  // Texto a filtrar
  String filter;
  
  // Loading indicator
  bool isLoading = false;

  //Error indicator
  bool isError = false;

 
  
  @override
  void initState() {
    super.initState();

    // El controlador debe verificar los cambios del filtro
    controller.addListener(() {
      setState((){
        filter = controller.text;
      });
    });

    // Obtenemos las unidades de rastreo
    getPreguntas();
  }

  // Metodo que se ejecuta al salir de la pantalla.
  @override
  void dispose(){
    super.dispose();
    print('Salio de la pantalla de busqueda');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          // isLoading? showLoadingIndicator : showListView();
          child:isError
              ?
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 16.0),
              child: Text('No hemos podido encontrar el recurso necesario, por favor contacta con tu proveedor de servicios.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),),
            ),
          )
              :
          isLoading
            ? Center(
              child: CircularProgressIndicator(),
            )
            : Container(
              child: Column(
                children: <Widget>[
                  searchBar(),
                  Expanded(
                    child:  getListView(),
                  ),
                ],
              ),
            ),
        ),
    );
  }

  Widget searchBar(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Escriba lo que busca ...',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
          suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: searchUnit,
              iconSize: 30.0,
          ),
        ),
      ),
    );
  }

  //funcion para buscar unidades en la lista
  searchUnit() {
  }

  void filterSearchResults(String query) {
    List<Pregunta> dummySearchList = duplicatedUnits;
    
    
    if(query.isNotEmpty) {
      List<Pregunta> dummyListData = List<Pregunta>();
      dummySearchList.forEach((item) {
        if(item.pregunta.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        units.clear();      
        units.addAll(dummyListData);
        duplicatedUnits = duplicatedUnits;
      });
      return;
    } else {
      setState(() {
        units.clear();
        units = List.from(duplicatedUnits);
        duplicatedUnits = duplicatedUnits;
      });
    }
  }

  Widget getListView(){

    return ListView.builder(
      shrinkWrap: true,
      itemCount: units.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(units[index].pregunta),
          child:(filter == null || filter == "") 
        ? unitCard(units[index]) : 
        units[index].pregunta.toLowerCase().contains(filter.toLowerCase()) 
        ? unitCard(units[index]) :
         new Container(),

          onDismissed: (direction){
            setState(() {
              units.removeAt(index);
            });
          },
          background: Container(
            color:Color.fromRGBO(39, 84, 186, 1),
          ),

        );
      },
    );
  }

  Card unitCard(Pregunta unit) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: unitListTile(unit),
      ),
    );
  }

  ListTile unitListTile(Pregunta unit) {
   
    
    return ListTile(
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
        unit.pregunta,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    
      subtitle: Text(unit.respuesta),

      trailing:
        GestureDetector(
          
          child: Icon(Icons.content_copy, color: Colors.grey, size: 20.0),
          onTap: () {
           Clipboard.setData(new ClipboardData(text: unit.pregunta+unit.respuesta));
          },
          ),
      onTap: () {
        //goToUnitMapScreen(context, unit);
      },
    );
  }




  Future <List<Pregunta>> getPreguntas() async {
    print('Entro a request!!!!!');
    String _url  = 'http://b96a0821.ngrok.io';

    // final url = Uri.http(_url, '/api/preguntas/');

    final resp =  await http.get( 'http://0d816943.ngrok.io/api/preguntas/');


    if (resp.statusCode == 200) {

      final decodedData =  json.decode(resp.body);

      final preguntas = new Preguntas.fromJsonList(decodedData);
    
      //pruebas
      print(preguntas.items);

      setState(() {
        units = preguntas.items;
        duplicatedUnits = preguntas.items; 
      });


     return preguntas.items;
    }

    
  }
}