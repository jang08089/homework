import 'package:flutter/material.dart';
import 'package:flutter_newtask/todoentity.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key, required this.todolist});

  final List<ToDoEntity> todolist;

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController detailcontroller = TextEditingController();
  bool detailtrue = false;
  bool savetrue = false;
  bool titlenotempty = false;
  bool favorite = false;

  @override
  void dispose() {
    titlecontroller.dispose();
    detailcontroller.dispose();
    super.dispose();
  }

  void showdetail() {
    setState(() {
      detailtrue = !detailtrue;
    });
  }

  void saveTodo() {
    if (titlecontroller.text.trim().isNotEmpty) {
      final newtodo = ToDoEntity(
        title: titlecontroller.text,
        description: detailcontroller.text,
        isDone: false,
        isFavorite: favorite,
      );
      Navigator.of(context).pop(newtodo);

      titlecontroller.clear();
      detailcontroller.clear();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 12,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null) {
                    return "할일을 입력해주세요";
                  }
                  if (value.isEmpty) {
                    return "할일을 입력해주세요";
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    if (value.trim().isEmpty) {
                      titlenotempty = false;
                    } else {
                      titlenotempty = true;
                    }
                  });
                },

                controller: titlecontroller,
                onFieldSubmitted: (value) {
                  saveTodo();
                },
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: '새 할일',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                  border: InputBorder.none,
                ),
              ),
              if (detailtrue == true)
                Column(
                  children: [
                    Divider(),
                    SizedBox(
                      height: 100,
                      child: TextField(
                        controller: detailcontroller,
                        maxLines: null,
                        expands: true,
                        decoration: InputDecoration(
                          hintText: '세부 정보 추가',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showdetail();
                    },
                    icon: Icon(Icons.short_text_rounded),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        favorite = !favorite;
                      });
                    },
                    icon: favorite
                        ? Icon(Icons.star)
                        : Icon(Icons.star_border_outlined),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      saveTodo();
                      formKey.currentState?.validate();
                    },
                    child: Container(
                      width: 45,
                      height: 45,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: Text(
                        '저장',
                        style: TextStyle(
                          color: titlenotempty ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
