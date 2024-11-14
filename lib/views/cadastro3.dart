import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_resenha/views/marcas_e_fotos.dart';

class ResenhaCadastro3 extends StatefulWidget {
  const ResenhaCadastro3({super.key});

  @override
  State<ResenhaCadastro3> createState() => _ResenhaCadastro3State();
}

class _ResenhaCadastro3State extends State<ResenhaCadastro3> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final _especieController = TextEditingController(text: 'Equino');
  final _idadeController = TextEditingController();
  final _racaController = TextEditingController();
  final _pelagemController = TextEditingController();
  final _subTipoPelagemController = TextEditingController();
  final _outrasCaracteristicasController = TextEditingController();
  final _olhoDireitoController = TextEditingController();
  final _olhoEsquerdoController = TextEditingController();
  
  String _sexoSelecionado = 'Fêmea';

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
              Get.to(() => MarcasFotos());
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
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(child: Text('2')),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
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
              
              // Espécie
              const Text('Espécie'),
              TextFormField(
                controller: _especieController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Idade
              const Text('Idade'),
              TextFormField(
                controller: _idadeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Sexo
              const Text('Sexo'),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _sexoSelecionado = 'Fêmea'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _sexoSelecionado == 'Fêmea' 
                          ? Colors.green 
                          : Colors.grey[300],
                    ),
                    child: const Text('Fêmea'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => setState(() => _sexoSelecionado = 'Macho'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _sexoSelecionado == 'Macho' 
                          ? Colors.green 
                          : Colors.grey[300],
                    ),
                    child: const Text('Macho'),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Raça
              const Text('Raça'),
              TextFormField(
                controller: _racaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Pelagem
              const Text('Pelagem'),
              TextFormField(
                controller: _pelagemController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Subtipo Pelagem
              const Text('Subtipo Pelagem'),
              TextFormField(
                controller: _subTipoPelagemController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Outras Características
              const Text('Outras Características (opcional)'),
              TextFormField(
                controller: _outrasCaracteristicasController,
                maxLines: 3,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Cor dos Olhos
              const Text('Cor dos Olhos'),
              const SizedBox(height: 8),
              
              const Text('Olho Direito'),
              TextFormField(
                controller: _olhoDireitoController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              
              const Text('Olho Esquerdo'),
              TextFormField(
                controller: _olhoEsquerdoController,
                decoration: const InputDecoration(
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
    _especieController.dispose();
    _idadeController.dispose();
    _racaController.dispose();
    _pelagemController.dispose();
    _subTipoPelagemController.dispose();
    _outrasCaracteristicasController.dispose();
    _olhoDireitoController.dispose();
    _olhoEsquerdoController.dispose();
    super.dispose();
  }
} 