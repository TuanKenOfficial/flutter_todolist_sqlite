import 'package:flutter/material.dart';
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  var todoTitleController = TextEditingController();

  var todoDescriptionController = TextEditingController();
  var todoDataController = TextEditingController();

  var _selectedValue;

  var _categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: todoTitleController ,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Write Todo Title'
              ),
            ),TextField(
              controller: todoDescriptionController ,
              decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Write Todo Description'
              ),
            ),TextField(
              controller: todoDataController ,
              decoration: InputDecoration(
                  labelText: 'Date',
                  hintText: 'Pick a date',
                  prefixIcon: InkWell(
                    onTap: () {},
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
            MaterialButton(onPressed: (){}, color: Colors.grey, child: Text('Save',style: TextStyle(color: Colors.yellow),),)
        ],
        ),
      ),
    );
  }
}


