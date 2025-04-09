import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Para el toggle de tema

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Mi App', style: TextStyle(fontSize: 22)),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.nightlight_round),
          onPressed: () {
            Get.changeTheme(
              Get.isDarkMode
                  ? ThemeData.light()
                  : ThemeData.dark(),
            );
          },
        ),
      ],
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Tarea 1'),
            onTap: () {
              // Acciones para navegar
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Tarea 2'),
            onTap: () {
              // Acciones para navegar
              Navigator.pop(context);
            },
          ),
          // Agrega más ListTile según sea necesario
        ],
      ),
    );
  }
}
