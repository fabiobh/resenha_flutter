import 'package:flutter/material.dart';

class TestarSeparacaoV2 extends StatelessWidget {
  const TestarSeparacaoV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Testar Separação V2'),
      ),
      body: Column(
        children: [
          Container(
            height: 60,
            color: Colors.blue, // Example color for the first widget
            child: const Center(child: Text('Widget 1')),
          ),
          Expanded(
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
          Container(
            height: 70,
            color: Colors.red, // Example color for the third widget
            child: const Center(child: Text('Widget 3')),
          ),
        ],
      ),
    );
  }
}