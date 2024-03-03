import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todosqliteapp/screen/categories_screen.dart';
import 'package:todosqliteapp/screen/home_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({super.key});

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
          child: ListView(
              children: <Widget>[
          UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
              'https://scontent.fvca1-2.fna.fbcdn.net/v/t39.30808-6/428602029_1423540068581636_4729918817390069911_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeE6uCusDOz-JttinTwqErq5XIubYEtMqDBci5tgS0yoMOvHpwv-R_ze6N83AVSTzLUKqAILZek5GZ3yQBqPwiK0&_nc_ohc=wSpSJ0hvBi0AX-993Ud&_nc_ht=scontent.fvca1-2.'
                  'fna&cb_e2o_trans=t&oh=00_AfCZDE8AJHrsDPUkmhR-8yn6OtJS19kkYbaxvcjqT83B9w&oe=65E877DE'
              ),
        ),
          accountName: Text('Vĩ Khang'),
          accountEmail: Text('admin@gmail.com'),
          decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(color: Colors.blue)
          ),
          ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
                ),
                ListTile(
                  leading: Icon(Icons.view_array  ),
                  title: Text('Categories'),
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen())),
                ),

    ],
    ),
    ),
    );
    }
}
