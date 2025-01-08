import 'package:flutter/material.dart';
import 'package:flutter_resenha/main.dart';
import 'package:flutter_resenha/views/sobre.dart';
import 'package:get/get.dart';
import '../views/fale_conosco.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Menu Principal'),
            onTap: () {
              Navigator.pop(context);
              Get.offAll(() => MyHomePage(title: 'Principal'));
            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text('Fale conosco'),
            onTap: () {
              Navigator.pop(context);
              Get.offAll(() => FaleConoscoView());
            },
          ),
          ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text('Avaliar o App'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre'),
            onTap: () {
              Navigator.pop(context);
              Get.offAll(() => SobreView());
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {

              _showExitDialog(context);
            },
          ),
        ],
      ),
    );
  }


  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Deseja realmente sair do sistema?"),
          actions: <Widget>[
            TextButton(
              child: Text("Não"),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text("Sim"),
              onPressed: () {
                // Adicione a lógica para sair do sistema aqui
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
          ],
        );
      },
    );
  }
}