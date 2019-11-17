import 'package:app_vip/categorias.dart';
import 'package:app_vip/home.dart';
import 'package:app_vip/login.dart';
import 'package:app_vip/routes/prueba.dart';
import 'package:app_vip/sign.dart';
import 'package:flutter/material.dart';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:app_vip/routes/routes.dart';

void main() => runApp(
  MaterialApp(
    initialRoute: '/',
    routes: getRoutes(),
    home: BottomNavBar(),
    debugShowCheckedModeBanner: false  
  )
);

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  int currentPage = 0;

  final CategoriasPage _categoriasPage = CategoriasPage();
  // final LoginPage _loginPage = LoginPage();
  final HomePage _homePage = HomePage();
  final SignPage _signPage = SignPage();
  //final Respuestas _prueba = Respuestas();

  Widget _showPage = new HomePage();

  Widget _pageChooser(int page){
    switch(page){
      case 0:
      return _homePage;
      break;

      case 1:
      return _categoriasPage;
      break;

      case 2:
      return _signPage;
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _showPage,
        bottomNavigationBar: FancyBottomNavigation(
          initialSelection: currentPage,
          circleColor: Color.fromRGBO(39, 84, 186, 1),
            tabs: [
                TabData(iconData: Icons.search, title: "Búsqueda",),
                TabData(iconData: Icons.library_books, title: "Especialidades"),
                TabData(iconData: Icons.alternate_email , title: "Correo")
            ],

            onTabChangedListener: (int position) {
                setState(() {
                _showPage = _pageChooser(position);
                  
                });
            },
        ));
  }
}



