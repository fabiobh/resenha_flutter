import 'package:flutter/material.dart';
import 'package:flutter_resenha/components/custom_drawer.dart';

class SobreView extends StatelessWidget {
  const SobreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre'),
        backgroundColor: Colors.yellow,
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/sobre/gedave.png', // Path to your gedave.png
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'GEDAVE Gestão de Defesa Animal e Vegetal\n'
              '\n'
              'CDA - Coordenadoria de Defesa Agropecuária\n'
              '\n'
              'Secretaria de Agricultura e Abastecimento\ndo Estado de São Paulo',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 40),
            const Text(
              'Este aplicativo foi desenvolvido por',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/sobre/prodesp.png', // Path to your prodesp.png
              height: 50,
            ),
            const SizedBox(height: 40),
            const Text(
              'Versão: 1.16.30',
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}