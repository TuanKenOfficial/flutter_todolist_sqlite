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
  var _editCategoryNameController = TextEditingController();
  var _editCategoryDescriptionController = TextEditingController();

  var _category = Category();
  var _categoryService = CategoryService();
  var id = 1; // xử lý id ở đây
  var category;


  List<Category> _categoryList = <Category>[];

  @override
  void initState(){
    super.initState();
    getAllCategories();
  }
  getAllCategories() async{
    _categoryList = <Category>[];
    var categories = await _categoryService.readCategory();
    categories.forEach((_category){
        setState(() {
          var categoryModel = Category();
          categoryModel.name = _category['name'];
          categoryModel.description = _category['description'];
          categoryModel.id = _category['id'];
          _categoryList.add(categoryModel);

        });
    });
  }
  _editCategory(BuildContext context, categoryId) async {
    category = await _categoryService.readCategoryById(categoryId);
    setState(() {
      _editCategoryNameController.text = category[0]['name'] ?? 'No name';
      _editCategoryDescriptionController.text = category[0]['description'] ?? 'No description';
    });
    _editFormDialog(context);
  }


  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              MaterialButton(color: Colors.red,onPressed: () => Navigator.pop(context),
                    child: Text('Cancel')),
              MaterialButton(color: Colors.lightBlueAccent,onPressed: () async{
                _category.id = id++;
                _category.name = _categoryNameController.text;
                _category.description = _categoryDescriptionController.text;

                var result = await _categoryService.saveCategory(_category);
                if(result>0){
                  print(result);
                  Navigator.pop(context);
                }
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
  _editFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              MaterialButton(color: Colors.red,onPressed: () => Navigator.pop(context),
                  child: Text('Cancel')),
              MaterialButton(color: Colors.lightBlueAccent,onPressed: () async{
                _category.id = category[0]['id'];
                _category.name = _editCategoryNameController.text;
                _category.description = _editCategoryDescriptionController.text;

                var result = await _categoryService.updateCategory(_category);
                if(result>0){
                  // print(result);
                  Navigator.pop(context);
                  getAllCategories();
                }
              }, child: Text('Update')),
            ],
            title: Text('Edit Categories Form'),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _editCategoryNameController,
                    decoration: InputDecoration(
                        hintText: 'Write a category',
                        labelText: 'Category'),
                  ),
                  TextField(
                    controller: _editCategoryDescriptionController,
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
      body: ListView.builder(itemCount: _categoryList.length,itemBuilder: (context, index){
          return Padding(
            padding:  EdgeInsets.only(top: 4.0,left: 16.0,right: 16.0),
            child: Card(
              child: ListTile(
                leading: IconButton(icon: Icon(Icons.edit),onPressed: (){
                  _editCategory(context, _categoryList[index].id);
                }),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(_categoryList[index].name),
                    IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){})
                  ],
                ),
                subtitle: Text(_categoryList[index].description),
              ),
            ),
          );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
