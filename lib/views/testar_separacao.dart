import 'package:flutter/material.dart';

class TestarSeparacao extends StatelessWidget {
  const TestarSeparacao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Testar Separação'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2, // 20% of the remaining space
            child: Container(
              color: Colors.red, // Example color
              child: const Center(child: Text('Widget 1')),
            ),
          ),
          Expanded(
            flex: 6, // 60% of the remaining space
            child: Container(
              color: Colors.green, // Example color
              child: const FittedBox(
                fit: BoxFit.contain,
                child: Image(
                  image: AssetImage('_assets_/icones/frente_cabeca_cavalo.png'), // Substitua pelo caminho da sua imagem
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2, // 20% of the remaining space
            child: Container(
              color: Colors.blue, // Example color
              child: const Center(child: Text('Widget 3')),
            ),
          ),
        ],
      ),
    );
  }
}