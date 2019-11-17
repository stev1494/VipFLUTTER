import 'package:app_vip/models/pregunta_model.dart';
import 'package:app_vip/providers/preguntas_provider.dart' ;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Respuestas extends StatelessWidget {



  final preguntasProvider = new PreguntasProvider();
      
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: FutureBuilder<List<Pregunta>>(
      future: preguntasProvider.getPreguntas(),

      
      builder: ( context, AsyncSnapshot <List<Pregunta>> snapshot) {

        if (snapshot.hasData){
         // print(snapshot.data);

         return ListView.builder(
           itemCount:snapshot.data.length,
           itemBuilder: ( context , int index){

             return Card(
               child: Row(children: <Widget>[
                 Text("${snapshot.data[index].subCategoria}"),
                //  Text("${snapshot.data[50].categoria}"),
                 
               ],),
             );
           },

         );
          
            // return Container(
            //     width: double.infinity,
            //    child:Center(child:Text(snapshot.data[50].categoria)));
        }else {
          return Container(
            child: Center(
              // child: Text("no hay")
              child: CircularProgressIndicator()
            )
          );
        }
        
      },
    )
    

    
    );
  }
  
}



