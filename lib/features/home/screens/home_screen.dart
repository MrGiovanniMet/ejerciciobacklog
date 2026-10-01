
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/details/screens/detail_screen.dart';
import 'package:flutter_application_1/features/home/models/item.dart';
import 'package:flutter_application_1/features/home/widgets/add_item_dialog.dart';
import 'package:flutter_application_1/features/home/widgets/item_card.dart';

class MyHomePage extends StatefulWidget {
  // cambia
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // opciones predefinidas para el DropdownButton
  List<String> categories = ['PC', 'Consola', 'Móvil', 'Libro', 'Película'];

  List<Item> itemList = [
    Item(title: "Elden Ring", category: "PC",complete: false),
    Item(title: "Dune", category: "Libro",complete: false),
    Item(title: "Interestelar", category: "Película", complete: false),
  ];

  // SnackBar: mensaje temporal abajo, se usa al agregar y al eliminar
  void showMessage(String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // quita el anterior
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 207, 31, 146),
        foregroundColor: Colors.white,
        title: Text('Mi lista de pendientes'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: itemList.length,
                itemBuilder: (context, index) {
                  final currentItem = itemList[index];

                  // Dismissible: deslizar para borrar, necesita una key unica
                  return Dismissible(
                    key: ObjectKey(currentItem),
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      final deletedTitle = currentItem.title;
                      setState(() {
                        itemList.removeAt(index); // se quita del arreglo
                      });
                      showMessage('"$deletedTitle" eliminado correctamente');
                    },
                    child: ItemCard(
                      item: currentItem,
                      onChanged: (value) {
                        setState(() {
                          currentItem.complete = value ?? false;
                        });
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(item: currentItem),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddItemDialog(
            context: context,
            categories: categories,
            onAdd: (newItem) {
              setState(() {
                itemList.add(newItem);
              });
              showMessage('"${newItem.title}" agregado correctamente');
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}