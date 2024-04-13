import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todosqliteapp/screen/categories_screen.dart';
import 'package:todosqliteapp/screen/home_screen.dart';
import 'package:todosqliteapp/screen/todo_by_category.dart';
import 'package:todosqliteapp/services/category_service.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  List<Widget> _categoryList = <Widget>[];

  CategoryService _categoryService = CategoryService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategories();
  }
  getAllCategories()  async {
    var categories = await _categoryService.readCategory();

    categories.forEach((category){
      setState(() {
        _categoryList.add(InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(
              builder: (context) => new TodoByCategory(category: category['name'],))),
            child: ListTile(
              title: Text(category['name']),
            ),
        ));
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdnphoto.dantri.com.vn/Jcq6kPM9HfGEzVWdTsg6_dzlZL0=/thumb_w'
                        '/1020/2024/04/07/xequansuisraeltaptranbiengioilibangreuters-1712461878780.jpg'
                ),
              ),
              accountName: Text('Vĩ Khang'),
              accountEmail: Text('admin@gmail.com'),
              decoration: ShapeDecoration.fromBoxDecoration(
                  BoxDecoration(color: Colors.blue)
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () =>
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeScreen())),
            ),
            ListTile(
              leading: Icon(Icons.view_array),
              title: Text('Categories'),
              onTap: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CategoriesScreen())),
            ),
            Divider(),
            Column(
              children: _categoryList,
            ),
          ],
        ),
      ),
    );
  }


}
