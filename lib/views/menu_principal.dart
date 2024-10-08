
import 'package:flutter/material.dart';
//import 'package:flutter_resenha/views/home.dart';

class MenuPrincipalWidget extends StatelessWidget {
  final String nome;
  final String cpf;

  const MenuPrincipalWidget({super.key, required this.nome, required this.cpf});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Principal'),
        backgroundColor: Colors.yellow,
      ),
      body: MenuPrincipalDetailsyWidget(nome: nome, cpf: cpf),          
    );
  }
}

class MenuPrincipalDetailsyWidget extends StatelessWidget {
  final String nome;
  final String cpf;

  const MenuPrincipalDetailsyWidget({super.key, required this.nome, required this.cpf});

  @override
  Widget build(BuildContext context) {
    
    return 
      Center(
          child: Column(children: [
            Image.asset("_assets_/resenha_2.png", 
              height: 200, 
              width: 150,
              fit: BoxFit.contain,
            ),

            const Text(
              'Equideos',
              style: TextStyle(
                fontSize: 28.0,
              ),
            ),

            const SizedBox(height: 15),
            Container(
              height: 70, 
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Veterinário Responsável'),
                  Text(nome),
                  Text('$cpf - CRMV-SP: 0000000000'),
                ],
              ),
            )
            

          ],
        ),
      );
  }
}