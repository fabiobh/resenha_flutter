import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_resenha/views/cadastro2.dart';

class ResenhaCadastro1 extends StatefulWidget {
  const ResenhaCadastro1({Key? key}) : super(key: key);

  @override
  State<ResenhaCadastro1> createState() => _ResenhaCadastro1State();
}

class _ResenhaCadastro1State extends State<ResenhaCadastro1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cpfCnpjController = TextEditingController();
  final TextEditingController _codigoAtividadeController = TextEditingController();
  final TextEditingController _coordenadasController = TextEditingController();
  
  int equinos = 0;
  int asininos = 0;
  int muares = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Resenha Virtual Equídeos'),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => ResenhaCadastro2());
            },
            child: const Text('Avançar'),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 1; i <= 4; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == 1 ? Colors.yellow : Colors.grey[300],
                      ),
                      child: Center(
                        child: Text(
                          '$i',
                          style: TextStyle(
                            color: i == 1 ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Identificação da Propriedade',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              TextFormField(
                controller: _cpfCnpjController,
                decoration: const InputDecoration(
                  labelText: 'CPF/CNPJ do Produtor',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              
              TextFormField(
                controller: _codigoAtividadeController,
                decoration: const InputDecoration(
                  labelText: 'Código da Atividade Produtiva (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              
              const Text(
                'Quantidade de Animais na AP',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Equinos'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (equinos > 0) {
                                    setState(() => equinos--);
                                  }
                                },
                              ),
                              Text('$equinos'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() => equinos++);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Asininos'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (asininos > 0) {
                                    setState(() => asininos--);
                                  }
                                },
                              ),
                              Text('$asininos'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() => asininos++);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        const Text('Muares'),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  if (muares > 0) {
                                    setState(() => muares--);
                                  }
                                },
                              ),
                              Text('$muares'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() => muares++);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              TextFormField(
                controller: _coordenadasController,
                decoration: const InputDecoration(
                  labelText: 'Coordenadas Geográficas',
                  helperText: 'Será capturada quando forem tiradas as fotos do animal',
                  border: OutlineInputBorder(),
                ),
                enabled: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  @override
  void dispose() {
    _cpfCnpjController.dispose();
    _codigoAtividadeController.dispose();
    _coordenadasController.dispose();
    super.dispose();
  }
}