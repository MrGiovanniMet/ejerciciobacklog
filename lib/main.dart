import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// Tenemos el main que lo que hace es correr la aplicacion es un widget que se llama myapp
// es un stateless widget que no tiene estado, es decir que no cambia,solo cambian los widgets
// luego material app, luego homepage que es la pagina principal
// luego tenemos el scaffold que es el esqueleto de la aplicacion, luego tenemos el appbar que es la barra superior
// luego tenemos appbar que es lo superior, luego tenemos el centro y un texto
// los componentes se construyen a traves de los hijos que tienen
// todos son clases los widgest



class MyApp extends StatelessWidget { // contenedor para mas wid
  const MyApp({super.key});
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // el corazon de la aplicacion
      title: 'Mi lista de pendientes',
      theme: ThemeData(
 
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 66, 19, 235)),
      ),
      home: const MyHomePage(), // pantalla inicial de la app
    );
  }
}
 