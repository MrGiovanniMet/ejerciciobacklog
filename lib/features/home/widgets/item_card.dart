import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/models/item.dart';

class ItemCard extends StatelessWidget {
  final Item item;
  final VoidCallback onTap; 
  final ValueChanged<bool?> onChanged;

  const ItemCard({
    super.key,
    required this.item,
    required this.onTap,
    required this.onChanged,
  });

  // regresa un icono dependiendo de la categoria
  IconData getIcon() {
    if (item.category == 'PC') {
      return Icons.computer;
    } else if (item.category == 'Consola') {
      return Icons.sports_esports;
    } else if (item.category == 'Móvil') {
      return Icons.smartphone;
    } else if (item.category == 'Libro') {
      return Icons.menu_book;
    } else {
      return Icons.movie;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(getIcon(), color: Colors.deepPurple),
        title: Text(
          this.item.title,
          style: TextStyle(
            decoration: this.item.complete ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(this.item.category),
        trailing: Checkbox(value: this.item.complete, onChanged: this.onChanged),
        onTap: this.onTap,
      ),
    );
  }
}