import 'package:flutter/material.dart';
import 'package:todosqliteapp/helpers/drawer_navigation.dart';
import 'package:todosqliteapp/screen/todo_screen.dart';
import 'package:todosqliteapp/services/todo_service.dart';

import '../models/todo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TodoService _todoService;
  List<Todo> _todoList = <Todo>[];

  @override
  initState(){
    super.initState();
    getAllTodos();
  }
  getAllTodos() async {
    _todoService = TodoService();
    _todoList = <Todo>[];

    var todos = await _todoService.readTodo();

    todos.forEach((todo){
      setState(() {
        var model = Todo();
        model.id = todo['id'];
        model.title = todo['title'];
        model.description = todo['description'];
        model.category = todo['category'];
        model.todoDate = todo['todoDate'];
        model.isFinished = todo['isFinished'];
        _todoList.add(model); //đưa dữ liệu ra màn hình
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist Sqlite App'),
        backgroundColor: Colors.yellow,
      ),
      drawer: DrawerNavigation(),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (context, index){
            return Padding(
              padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)
                ),
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(_todoList[index].title ?? 'No Title')
                    ],
                  ),
                  subtitle: Text(_todoList[index].category ?? 'No Category'),
                  trailing: Text(_todoList[index].todoDate ?? 'No Date'),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(onPressed: () =>Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>TodoScreen()))
        ,child: Icon(Icons.add),
      ),
    );
  }
}
