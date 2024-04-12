class Todo{
  late int id;
  late String title;
  late String description;
  late String category;
  late String todoDate;
  late int isFinished;

  TodoMap(){
    var mapping = Map<String,dynamic>();
    if(id != null){
      mapping['id']=id;
    }
    mapping['title']=title;
    mapping['description']=description;
    mapping['category']=category;
    mapping['todoDate']=todoDate;
    mapping['isFinished']=isFinished;

    return mapping;
  }
}