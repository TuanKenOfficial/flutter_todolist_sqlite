import 'package:flutter/material.dart';
import 'package:todosqliteapp/models/category.dart';
import 'package:todosqliteapp/screen/home_screen.dart';
import 'package:todosqliteapp/services/category_service.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

  var _categoryNameController = TextEditingController();
  var _categoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();

  var id = 1;

  // List<Category> _categoryList =  List<Category>();

  getAllCategories() async{
    // _categoryList = List<Category>();
    var categories = await _categoryService.readCategory();
  }


  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              MaterialButton(color: Colors.red,onPressed: ()=> Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => CategoriesScreen())),
                    child: Text('Cancel')),
              MaterialButton(color: Colors.lightBlueAccent,onPressed: () async{
                _category.id = id++;
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;

                var result = await _categoryService.saveCategory(_category);
                print(result);
              }, child: Text('Save')),
            ],
            title: Text('Categories Form'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _categoryNameController,
                    decoration: InputDecoration(
                        hintText: 'Write a category',
                        labelText: 'Category'),
                  ),
                  TextField(
                    controller: _categoryDescriptionController,
                    decoration: InputDecoration(
                        hintText: 'Write a description',
                        labelText: 'Description Category'),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MaterialButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen())),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text('Categories'),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white, //làm màu chữ title Categories
      ),
      body: Center(child: Text('Danh mục Categories')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
