
class Category{
    late int id;
    late String name;
    late String description;

  categoryMap(){
      var mapping = Map<String, Object>();
      if(id != null){
        mapping['id']= id;
      }
      mapping['name']= name;
      mapping['description']= description;

      return mapping;
   }
}