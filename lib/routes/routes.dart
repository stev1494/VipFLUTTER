import 'package:app_vip/busqueda_page.dart';
import 'package:app_vip/categorias_details.dart';
import 'package:app_vip/routes/prueba.dart';
import 'package:app_vip/sign.dart';
import 'package:flutter/material.dart';

import 'package:app_vip/categorias.dart';
import 'package:app_vip/login.dart';
import 'package:app_vip/home.dart';




Map <String , WidgetBuilder > getRoutes(){

  return <String, WidgetBuilder>{
        '/sign'                 : ( context ) =>SignPage(),
        '/busqueda'             : ( context ) => FleetScreen(),
        '/cliper'               : ( context ) => CategoriaDetalle(),
        '/prueba'               : ( context ) => Respuestas(),
        '/categorias'           : ( context ) => CategoriasPage(),
        '/login'                : ( context ) => LoginPage(),
        '/home'                 : ( context ) => HomePage(),
        
        
  };
}
