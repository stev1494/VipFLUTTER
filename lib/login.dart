
import 'package:flutter/material.dart';

import 'CustomShapeClipper_detail.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
 


  @override
  Widget build(BuildContext context) {


       return Scaffold(
          body: Stack(

        children: <Widget>[


          ClipPath(
            clipper: CustomShapeClipperDetail(),
            child: Container(
              height: 300.0,
              color: Color.fromRGBO(232, 232, 232, 1)
            ),
          ),
              
        
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                
                Container(
                  
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 55.0),
                       
                                      
                      child: Row(   
                        children: <Widget>[
                        
                          Align(
                              alignment: Alignment.topLeft ,
                              child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Column(
                                  children:<Widget>[

                                    Padding(
                                      padding: const EdgeInsets.only(left:18.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text( 'Revisa,\nnuestra\nrespuesta \nen tu email',
                                          style: TextStyle(
                                          fontSize: 34.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 36, 65, 1),
                                          ),
                                        textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:18.0),
                                      child: Text.rich(
                                        TextSpan(text: 'Cuéntanos tu preocupación.\n ',
                                          children: <TextSpan>[
                                              TextSpan(text: 'Te asesoramos legalmente.', style: TextStyle(fontWeight: FontWeight.bold)),
                                            ],
                                        )
                                      ),
                                    ),

                                      
                                  ]
                              ),
                            ),
                          ),

                          

                        ],
                                        
                      ),
                  ),
                ),


                Padding(
                  // padding: const EdgeInsets.all(25.0),
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                  
                  child: TextField(

                      maxLines: 7,
                      decoration: InputDecoration(
                       hintText: 'Escribe aquí la pregunta o duda legal...',  
                       border: OutlineInputBorder()
                      )
                  ),
                ),

           
                    Row(
                      children: <Widget>[
                        Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0.5, 10, 5),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Color.fromRGBO(39, 84, 186, 1),
                          onPressed: (){},
                          child: const Text(
                              'ENVIAR',
                              style: TextStyle(fontSize: 20)
                            ),
                        ),
                      ),
                    

                      ],
                    )
                                         

                //Padding(padding: EdgeInsets.symmetric(vertical: 400.0 )),
              ],
            ),
          ),
        ],
      ),
    );
    
  }


}