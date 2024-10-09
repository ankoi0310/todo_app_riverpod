import 'package:flutter/material.dart';

enum TaskCategory {
  work(Icons.school, Colors.blueGrey),
  home(Icons.home, Colors.purple),
  shopping(Icons.shopping_cart, Colors.orange),;

  const TaskCategory(
    this.icon,
    this.color,
  );

  final IconData icon;
  final Color color;
}
