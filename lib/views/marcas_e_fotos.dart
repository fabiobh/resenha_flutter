import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'marcas_animal.dart';
import 'testar_separacao.dart';
import 'fotos_V2.dart';

class MarcasFotos extends StatelessWidget {
  const MarcasFotos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('Resenha Virtual Equídeos'),
        leading: TextButton(
          child: const Text('Voltar', style: TextStyle(color: Colors.black)),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            child: const Text('Finalizar', style: TextStyle(color: Colors.black)),
            onPressed: () {
              Get.to(() => FotosV2());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Progress indicators
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(backgroundColor: Color(0xFFB8860B), child: Text('1')),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Color(0xFFB8860B), child: Text('2')),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Color(0xFFB8860B), child: Text('3')),
                  SizedBox(width: 8),
                  CircleAvatar(backgroundColor: Color(0xFFFFD700), child: Text('4')),
                ],
              ),
              const SizedBox(height: 24),
              
              // MARCAS and FOTOS sections
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MarcasAnimal()),
                        );
                      },
                      child: Container(
                        color: Colors.grey[700],
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'MARCAS',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => FotosV2());
                      },
                      child: Container(
                        color: Colors.grey[700],
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'FOTOS',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              
              // Missing items sections
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Particularidades não encontradas: ',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Cabeça, Focinho, Pescoço, Lateral Esquerda, Lateral Direita, Membros Anteriores, Membros Posteriores',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              RichText(
                text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Fotos não encontradas: ',
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'Cabeça, Traseira, Lateral Esquerda, Lateral Direita',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Description section
              const Text(
                'Descrição das Particularidades',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                color: Colors.grey[400],
                // TODO: Add text input field for description
              ),
            ],
          ),
        ),
      ),
    );
  }
}
