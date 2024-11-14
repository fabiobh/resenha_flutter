import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_resenha/views/cadastro3.dart';

class ResenhaCadastro2 extends StatefulWidget {
  const ResenhaCadastro2({super.key});

  @override
  State<ResenhaCadastro2> createState() => _ResenhaCadastro2State();
}

class _ResenhaCadastro2State extends State<ResenhaCadastro2> {
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para os campos de texto
  final _nomeController = TextEditingController();
  final _microchipController = TextEditingController();
  final _microchip2Controller = TextEditingController();
  final _microchip3Controller = TextEditingController();
  final _diaController = TextEditingController();
  final _mesController = TextEditingController();
  final _anoController = TextEditingController();
  final _associacaoController = TextEditingController();
  final _passaporteController = TextEditingController();
  final _microchipMaeController = TextEditingController();

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
              // Implementar navegação para próxima tela
              Get.to(() => ResenhaCadastro3());
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
              // Indicador de progresso
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: Text('1')),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: Text('2')),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: Text('3')),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: Text('4')),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Identificação do Animal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Nome do Animal',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _microchipController,
                decoration: const InputDecoration(
                  labelText: 'Microchip',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _microchip2Controller,
                decoration: const InputDecoration(
                  labelText: 'Microchip (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _microchip3Controller,
                decoration: const InputDecoration(
                  labelText: 'Microchip (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Data de Nascimento'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _diaController,
                      decoration: const InputDecoration(
                        labelText: 'Dia',
                        hintText: 'DD',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _mesController,
                      decoration: const InputDecoration(
                        labelText: 'Mês',
                        hintText: 'MM',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      controller: _anoController,
                      decoration: const InputDecoration(
                        labelText: 'Ano',
                        hintText: 'AAAA',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _associacaoController,
                decoration: const InputDecoration(
                  labelText: 'Número da Associação de Raça (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passaporteController,
                decoration: const InputDecoration(
                  labelText: 'Número do Passaporte (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _microchipMaeController,
                decoration: const InputDecoration(
                  labelText: 'Microchip da Mãe (opcional)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _microchipController.dispose();
    _microchip2Controller.dispose();
    _microchip3Controller.dispose();
    _diaController.dispose();
    _mesController.dispose();
    _anoController.dispose();
    _associacaoController.dispose();
    _passaporteController.dispose();
    _microchipMaeController.dispose();
    super.dispose();
  }
} 