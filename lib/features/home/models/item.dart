import 'package:flutter/material.dart';

class Item {
  final String title;
  final String category;
  bool complete; 

  Item({
    required this.title,
    required this.category,
    this.complete=false,
  });
}