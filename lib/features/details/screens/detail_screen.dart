import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/item.dart';

class DetailScreen extends StatelessWidget {
  final Item item;

  const DetailScreen({
    super.key, required this.item});

  @override
  Widget build (BuildContext context){

    return Scaffold(
      appBar: AppBar(title: Text(this.item.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('Detalles del elemento'),
            SizedBox(height: 16),
            Text('Titulo: ${this.item.title}'),
            Text('Categoria: ${this.item.category}'),
            Text(this.item.complete ? 'Estado: Completado' : 'Estado: Pendiente'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child:
              Text('Volver?')
            ),
          ],
        ),
      ),
    );
  }
}