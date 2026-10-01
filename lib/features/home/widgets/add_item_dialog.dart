import 'package:flutter_application_1/features/home/models/item.dart';
import 'package:flutter/material.dart';

// funcion que muestra el AlertDialog con el formulario para agregar
void showAddItemDialog({
  required BuildContext context,
  required List<String> categories,
  required void Function(Item) onAdd, // le regresa el item nuevo a la home
}) {
  final titleController = TextEditingController();
  String selectedCategory = categories.first;

  showDialog(
    context: context,
    builder: (dialogContext) {
      // StatefulBuilder le da su propio setState al dialogo
      // sin esto el dropdown no se actualiza al elegir
      return StatefulBuilder(
        builder: (context, setStateDialog) {
          return AlertDialog(
            title: Text('Agregar elemento'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Titulo'),
                ),
                SizedBox(height: 16),
                DropdownButton<String>(
                  isExpanded: true,
                  value: selectedCategory, // opcion seleccionada ahora
                  items: categories.map((category) {
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setStateDialog(() {
                        selectedCategory = value;
                      });
                    }
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: Text('Cancelar'),
              ),
              ElevatedButton(
                onPressed: () {
                  final title = titleController.text.trim();
                  if (title.isEmpty) return; // no agrega si esta vacio

                  onAdd(Item(title: title, category: selectedCategory));
                  Navigator.pop(dialogContext);
                },
                child: Text('Agregar'),
              ),
            ],
          );
        },
      );
    },
  );
}