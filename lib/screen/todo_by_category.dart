import 'package:flutter/material.dart';
import 'package:todosqliteapp/services/todo_service.dart';

import '../models/todo.dart';

class TodoByCategory extends StatefulWidget {
  final String category;

  TodoByCategory({required this.category});

  @override
  State<TodoByCategory> createState() => _TodoByCategoryState();
}

class _TodoByCategoryState extends State<TodoByCategory> {
  List<Todo> _todoList = <Todo>[];
  TodoService _todoService = TodoService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodosByCategories();
  }

  getTodosByCategories() async {
    var todos = await _todoService.readTodoByCategory(this.widget.category);
    todos.forEach((todo) {
      setState(() {
        var model = Todo();
        model.title = todo['title'];
        model.description = todo['description'];
        model.todoDate = todo['todoDate'];

        _todoList.add(model);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.category),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                  itemCount: _todoList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0,left: 8.0, right: 8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)
                        ),
                        elevation: 8,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(_todoList[index].title ?? 'No Title')
                            ],
                          ),
                          subtitle: Text(
                              _todoList[index].description ?? 'No Description'),
                          trailing: Text(_todoList[index].todoDate ?? 'No Date'),
                        ),
                      ),
                    );
                  })),
        ],
      ),
    );
  }
}
