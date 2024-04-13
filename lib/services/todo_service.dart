import 'package:todosqliteapp/models/category.dart';
import 'package:todosqliteapp/models/todo.dart';
import 'package:todosqliteapp/reponsitoies/repository.dart';

class  TodoService{

  late  Repository _repository;

   TodoService(){
    _repository = Repository();
   }
  //create data
  saveTodo(Todo todo) async{
    return await _repository.insertData('todos', todo.TodoMap());
  }

  //Read data
  readTodo() async{
     return await _repository.readData('todos');
  }

  //read todos by category
  readTodoByCategory(category) async {
     return await _repository.readDataByColumnName('todos', 'category', category);
  }

  // //read data from table by Id
  // readTodoById(todoId) async {
  //   return await _repository.readDataById('todos', todoId);
  // }
  //
  // //update data from table
  // updateTodo(Todo todo) async {
  //    return await _repository.updateData('todos',todo.TodoMap());
  // }
  //
  // //delete
  // deleteTodo(todoId) async {
  //   return await _repository.deleteData('todos', todoId);
  // }
}