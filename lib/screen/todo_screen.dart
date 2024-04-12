import 'package:flutter/material.dart';
import 'package:todosqliteapp/models/todo.dart';
import 'package:todosqliteapp/services/category_service.dart';
import 'package:intl/intl.dart';
import 'package:todosqliteapp/services/todo_service.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var _todoTitleController = TextEditingController();

  var _todoDescriptionController = TextEditingController();
  var _todoDataController = TextEditingController();

  var _selectedValue;

  var _categories = <DropdownMenuItem>[];
  var id = 1; // xử lý id tại đây

  @override
  void initState(){
    super.initState();
    _loadCategories();
  }
  _loadCategories() async {
    var _categoryService = CategoryService();
    var categories = await _categoryService.readCategory();
    categories.forEach((category){
      setState(() {
          _categories.add(DropdownMenuItem(child: Text(category['name']),
          value: category['name'],
          ));
      });
    });
  }

  DateTime dateTime = DateTime.now();

  _seletedTodoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(context: context,initialDate: dateTime,
        firstDate: DateTime(2000), lastDate: DateTime(2100));
    if(_pickedDate != null){
      setState(() {
        dateTime = _pickedDate;
        _todoDataController.text = DateFormat('yyyy-MM-dd').format(_pickedDate);

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextField(
                controller: _todoTitleController ,
                decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Write Todo Title'
                ),
              ),TextField(
                controller: _todoDescriptionController ,
                decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Write Todo Description'
                ),
              ),TextField(
                controller: _todoDataController ,
                decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'Pick a date',
                    prefixIcon: InkWell(
                      onTap: () {
                        _seletedTodoDate(context);
                      },
                      child: Icon(Icons.calendar_today),
                    )
                ),
              ),
              DropdownButtonFormField(
                  value: _selectedValue,
                  items: _categories,
                  hint: Text('Category'),
                  onChanged: (value){
                    setState(() {
                      _selectedValue = value;
                    });
                  }
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(onPressed: () async {
                var todoObject = Todo();
                if(id != null){
                  todoObject.id = id++;
                }
                todoObject.title = _todoTitleController.text;
                todoObject.description = _todoDescriptionController.text;
                todoObject.category = _selectedValue.toString();
                todoObject.todoDate = _todoDataController.text;
                todoObject.isFinished = 0;

                var _todoService = TodoService();
                var result = await _todoService.saveTodo(todoObject);
                print(result);
                print(todoObject.id);
              },
                color: Colors.grey,
                child: Text('Save',style: TextStyle(color: Colors.yellow),),)
            ],
          ),
        ),
      ),
    );
  }
}


