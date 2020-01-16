
import 'package:flutter/material.dart';

import 'package:app_vip/CustomShapeClipper.dart';
import 'package:app_vip/categorias_details.dart';

import 'busqueda_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
         Stack(
        
        children: <Widget>[

          ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: 380.0,
              color: Color.fromRGBO(232, 232, 232, 1)
            ),
          ),
              

          Positioned(
               
               left: 90,
               
               bottom: 200 ,
              child: Padding(
              padding: const EdgeInsets.only(left:28.0),
              child: Align(
                      alignment: Alignment.topLeft,
                        child: Padding(
                        padding: const EdgeInsets.only(left: 60.0,top:90.0,right: 10.0),
                        
                        //child: Icon(Icons.email),
                        child: Image.asset('images/encabezado-1-200x.png'),
                        //height: 180.0, width: 180.0,)
                      ),
              ),
            ),
          ),
          
        
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 45.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: InkWell(
                            
                            onTap: (){
                              
                              setState(() {
                               Navigator.pushNamed(context, '/busqueda');
                              });
                              
                            },
                            child: Container(
                            padding: EdgeInsets.only(top: 5, left: 10),
                            constraints: BoxConstraints.expand(height: 50, width: 800),
                            color: Colors.transparent,
                            
                            child: Row(children: <Widget>[
                              Icon(
                                        
                                        Icons.search,
                                        color: Color.fromRGBO(0, 0, 0, 0.4),
                                  ),
                              Padding(padding: EdgeInsets.symmetric(horizontal: 17.0 , vertical: 14.0),),
                              Center(child: Text("Escribe lo que buscas...")),

                            ],)
                          ),
                        ),
                      ),
                    ),
                  ),
              
                Column(
                  children:<Widget>[

                        Padding(
                          padding: const EdgeInsets.only(left:18.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text( '¿Dudas\nlegales?',
                              style: TextStyle(
                              fontSize: 34.0,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 36, 65, 1),
                            ),
                             textAlign: TextAlign.left,
                       ),
                          ),
                        ),

                       Row(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
                             child: Text.rich(
                               TextSpan(text: 'Regístrate y obtén tu primera\nasesoría legal ',
                                children: <TextSpan>[
                                    TextSpan(text: 'gratuíta', style: TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                               )
                             ),
                           ),

                          
                         ],
                       ),

                       Padding(
                         padding: const EdgeInsets.only(left:18.0, bottom: 60.0),
                         child: Align(
                           alignment: Alignment.centerLeft,
                           child: RaisedButton(
                            onPressed: () { Navigator.pushNamed(context, '/busqueda'); },
                            child: Text( 'COMENZAR',
                                style: TextStyle(fontSize: 20 , color: Colors.white),
                            ),
                            color: Color.fromRGBO(39, 84, 186, 1),
                      ),
                         ),
                       ),

                    //Text('Aqui va la imagen')
                  ]
                ),
               Padding(
                 padding: const EdgeInsets.only(left: 18.0,top: 5),
                 child: Align(
                   alignment: Alignment.centerLeft,
                        child: Text( 'Especialidades',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 36, 65, 1),
                        ),
              
                   ),
                 ),
               ),

                Padding(
                  padding: const EdgeInsets.only(top:30.0,left:18.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                          listaH(context , 'icon-aduanero','Aduanero'),
                          SizedBox(width: 10.0,),
                          listaH( context, 'icon-ambiental','Ambiental'),
                          SizedBox(width: 10.0,),
                          listaH( context, 'icon-civil','Civil'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-comercio','Comercio'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-constitucional','Constitucional'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-empresarial','Empresarial'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-inquilinato','Inquilinato'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-laboral','Laboral'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-ninez','Niñez'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-penal','Penal'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-propiedad-intelectual','Propiedad Intelectual'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-sede-administrativa','Sede Administrativa'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-transito','Transito'),
                            SizedBox(width: 10.0,),
                            listaH( context, 'icon-tributario','Tributario'),
                            SizedBox(width: 10.0,),

                                    ],
                                ),
                        ),
                    ),
                ),

                //Padding(padding: EdgeInsets.symmetric(vertical: 400.0 )),
              ],
            ),
          ),
        ],
      ),

      ],
        
    );
  }

  Widget listaH( BuildContext context , String ruta , String index){

    return  Column(

      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RaisedButton(

           onPressed: () { Navigator.pushNamed(context, '/cliper', arguments: index); },
           
           child: Image( 
              image:AssetImage('images/$ruta.png'),
              height: 50,
              width: 50,
              
              ),
          
            color: Color.fromRGBO(232, 232, 232, 1),
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
          ),
          // Text('Hola')
      ],


    );

  }
}