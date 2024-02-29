import 'package:todosqliteapp/models/category.dart';
import 'package:todosqliteapp/reponsitoies/repository.dart';

class  CategoryService{

  late  Repository _repository;

   CategoryService(){
    _repository = Repository();
   }

  saveCategory(Category category) async{
    return await _repository.insertData('categories', category.categoryMap());
  }
}