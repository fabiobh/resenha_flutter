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
              color: Colors.red,
              child: const Center(child: Text('Use o Testar separação V2')),
            ),
          ),
          Expanded(
            flex: 6, // 60% of the remaining space
            child: Container(
              color: Colors.green,
              child: const FittedBox(
                fit: BoxFit.contain,
                child: Image(
                  image: AssetImage('assets/icones/frente_cabeca_cavalo.png'), // Substitua pelo caminho da sua imagem
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2, // 20% of the remaining space
            child: Container(
              color: Colors.blue,
              child: const Center(child: Text('É melhor que esse')),
            ),
          ),
        ],
      ),
    );
  }
}