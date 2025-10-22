import 'package:flutter/material.dart';
import 'package:flutter_newtask/todoentity.dart';

class Tododetailpage extends StatefulWidget {
  final ToDoEntity todo;
  final VoidCallback onToggleFavorite;
  const Tododetailpage(this.todo, this.onToggleFavorite, {super.key});

  @override
  State<Tododetailpage> createState() => _TododetailpageState();
}

class _TododetailpageState extends State<Tododetailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                widget.onToggleFavorite();
                widget.todo.isFavorite = !widget.todo.isFavorite;
              });
            },
            icon: Icon(widget.todo.isFavorite ? Icons.star : Icons.star_border),
          ),
        ],
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 200,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.todo.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.short_text_rounded),
                    SizedBox(width: 10),
                    Text("세부 내용은 다음과 같습니다."),
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Expanded(child: Text("${widget.todo.description}")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
