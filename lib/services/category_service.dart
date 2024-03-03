import 'package:todosqliteapp/models/category.dart';
import 'package:todosqliteapp/reponsitoies/repository.dart';

class  CategoryService{

  late  Repository _repository;

   CategoryService(){
    _repository = Repository();
   }
  //create data
  saveCategory(Category category) async{
    return await _repository.insertData('categories', category.toMap());
  }

  //Read data
  readCategory() async{
     return await _repository.readData('categories');
  }
}