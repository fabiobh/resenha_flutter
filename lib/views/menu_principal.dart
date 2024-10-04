
import 'package:flutter/material.dart';
//import 'package:flutter_resenha/views/home.dart';

class MenuPrincipalWidget extends StatefulWidget {
  const MenuPrincipalWidget({super.key});

  @override
  State<MenuPrincipalWidget> createState() => _MenuPrincipalWidgetState();
}

class _MenuPrincipalWidgetState extends State<MenuPrincipalWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        backgroundColor: Colors.yellow,
      ),
      body: const MenuPrincipalDetailsyWidget(),          
    );
  }
}

class MenuPrincipalDetailsyWidget extends StatefulWidget {
  const MenuPrincipalDetailsyWidget({super.key});

  @override
  State<MenuPrincipalDetailsyWidget> createState() => _MenuPrincipalDetailsyWidgetState();
}

class _MenuPrincipalDetailsyWidgetState extends State<MenuPrincipalDetailsyWidget> {
  @override
  Widget build(BuildContext context) {
    return 
      Center(
          child: Column(children: [
            const SizedBox(height: 20),
            Image.asset("_assets_/resenha_2.png", 
              height: 200, 
              width: 150,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),
            const Text(
              'Equideos',
              style: TextStyle(
                fontSize: 28.0,
              ),
            ),

            const SizedBox(height: 20),
            Container(
              height: 100, 
              width: double.infinity,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2)
              ),
              child: const Column(
                children: [
                  Text('My Awesome Border'),
                ],
              ),
            )
            

          ],
        ),
      );
  }
}