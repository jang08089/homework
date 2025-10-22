import 'package:flutter/material.dart';
import 'package:flutter_newtask/tododetailpage.dart';
import 'package:flutter_newtask/todoentity.dart';

class Todoview extends StatelessWidget {
  final ToDoEntity todo;
  final VoidCallback onToggleDone;
  final VoidCallback onToggleFavorite;

  const Todoview({
    super.key,
    required this.todo,
    required this.onToggleFavorite,
    required this.onToggleDone,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Tododetailpage(todo,onToggleFavorite)),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                onToggleDone();
                todo.isDone = !todo.isDone;
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2.0),
                  shape: BoxShape.circle,
                  color: todo.isDone ? Colors.black : null,
                ),
                child: todo.isDone
                    ? Icon(Icons.check, size: 20, color: Colors.white)
                    : null,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.transparent,
                child: Text(
                  todo.title,
                  style: TextStyle(
                    fontSize: 18,
                    decoration: todo.isDone ? TextDecoration.lineThrough : null,

                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            IconButton(
              onPressed: () {
                onToggleFavorite();
              },
              icon: Icon(todo.isFavorite ? Icons.star : Icons.star_border),
            ),
          ],
        ),
      ),
    );
  }
}
