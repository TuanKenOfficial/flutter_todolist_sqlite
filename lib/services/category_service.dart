import 'package:todosqliteapp/models/category.dart';
import 'package:todosqliteapp/reponsitoies/repository.dart';

class  CategoryService{

  late  Repository _repository;

   CategoryService(){
    _repository = Repository();
   }
  //create data
  saveCategory(Category category) async{
    return await _repository.insertData('categories', category.CategoryMap());
  }

  //Read data
  readCategory() async{
     return await _repository.readData('categories');
  }

  //read data from table by Id
  readCategoryById(categoryId) async {
    return await _repository.readDataById('categories', categoryId);
  }

  //update data from table
  updateCategory(Category category) async {
     return await _repository.updateData('categories',category.CategoryMap());
  }

  deleteCategory(categoryId) async {
    return await _repository.deleteData('categories', categoryId);
  }
}