import 'package:flutter/material.dart';
import 'CustomShapeClipper_detail.dart';



class SignPage extends StatefulWidget {
  @override
  _SignPageState createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
 
@override
  Widget build(BuildContext context) {


       return Scaffold(
          body: Stack(

        children: <Widget>[


          ClipPath(
            clipper: CustomShapeClipperDetail(),
            child: Container(
              height: 245.0,
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
                                        child: Text( 'Hola,\nAccede a\ntu consulta \nlegal gratuíta',
                                          style: TextStyle(
                                          fontSize: 34.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(0, 36, 65, 1),
                                          ),
                                        textAlign: TextAlign.left,
                                        ),
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
                  
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                  
                  child: TextField(

                      // maxLines: 7,
                      decoration: InputDecoration(

                       hintText: 'Escriba su nombre',  
                       border: OutlineInputBorder(),
                       suffixIcon:Icon(Icons.person),
                      )
                  ),
                ),


                Padding(
                  
                  padding: const EdgeInsets.fromLTRB(25, 15, 25, 5),
                  
                  child: TextField(

                      // maxLines: 7,
                      decoration: InputDecoration(

                       hintText: 'Escriba su correo',  
                       border: OutlineInputBorder(),
                       suffixIcon:Icon(Icons.email),
                      )
                  ),
                ),

           
                Row(
                  children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(250, 0.5, 10, 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                            child: RaisedButton(
                            
                            textColor: Colors.white,
                            color: Color.fromRGBO(39, 84, 186, 1),
                            onPressed: (){
                              Navigator.pushNamed(context, '/login');
                            },
                            child:Icon(Icons.chevron_right, size: 30,)
                          ),
                        ),
                    ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
    
  }
}