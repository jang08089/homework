import 'package:flutter/material.dart';
import 'package:flutter_newtask/bottom.dart';
import 'package:flutter_newtask/todoentity.dart';
import 'package:flutter_newtask/todoview.dart';

String name = "준혁's Taks";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<ToDoEntity> todolist = [];

  Future<void> addtodo() async {
    final ToDoEntity? result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Bottom(todolist: todolist),
    );

    if (result != null) {
      setState(() {
        todolist.add(result);
      });
    }
  }

  void onToggleDone(ToDoEntity element) {
    setState(() {
      int index = todolist.indexOf(element);
      ToDoEntity todo = todolist[index];
      todolist[index] = ToDoEntity(
        title: todo.title,
        description: todo.description,
        isDone: !todo.isDone,
        isFavorite: todo.isFavorite,
      );
    });
  }

  void onToggleFavorite(ToDoEntity element) {
    setState(() {
      int index = todolist.indexOf(element);
      ToDoEntity todo = todolist[index];
      todolist[index] = ToDoEntity(
        title: todo.title,
        description: todo.description,
        isDone: todo.isDone,
        isFavorite: !todo.isFavorite,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).dividerColor,
      resizeToAvoidBottomInset: false,
      body: todolist.isEmpty ? mainbox() : todolistview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addtodo();
        },
        shape: CircleBorder(),
        backgroundColor: Colors.red[800],
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget mainbox() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).dividerColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.network("https://picsum.photos/100/100"),
          ),
          Spacer(),
          Text(
            '아직 할 일이 없음',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            '할 일을 추가하고 $name에서 \n 할 일을 추적하세요.',
            style: TextStyle(fontSize: 14, height: 1.5),
            textAlign: TextAlign.center,
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget todolistview() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemBuilder: (context, index) {
          ToDoEntity item = todolist[index];
          return Todoview(
            todo: item,
            onToggleDone: () => onToggleDone(item),
            onToggleFavorite: () => onToggleFavorite(item),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: todolist.length,
      ),
    );
  }
}
