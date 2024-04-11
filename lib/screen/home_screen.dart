import 'package:flutter/material.dart';
import 'package:todosqliteapp/helpers/drawer_navigation.dart';
import 'package:todosqliteapp/screen/todo_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todolist Sqlite App'),
        backgroundColor: Colors.yellow,
      ),
      drawer: DrawerNavigation(),
      floatingActionButton: FloatingActionButton(onPressed: () =>Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) =>TodoScreen()))
        ,child: Icon(Icons.add),
      ),
    );
  }
}
