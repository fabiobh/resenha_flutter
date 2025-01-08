import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MarcasAnimal extends StatelessWidget {
  const MarcasAnimal({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ParticularidadesScreen(),
    );
  }
}

class ParticularidadesScreen extends StatefulWidget {
  const ParticularidadesScreen({super.key});

  @override
  _ParticularidadesScreenState createState() => _ParticularidadesScreenState();
}

class _ParticularidadesScreenState extends State<ParticularidadesScreen> {
  bool _showDraggableImage = false;
  //Offset _imageOffset = Offset(50, 50);
  Offset _imageOffset = Offset(0, 0);
  final GlobalKey _blueContainerKey = GlobalKey(); // Declare the key

  final List<String> items = [
    'Cabeça',
    'Focinho',
    'Pescoço',
    'Lateral Direita',
    'Lateral Esquerda',
    'Membros Anteriores',
    'Membros Superiores'
  ];

  void _showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerta'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildButton(Widget child, VoidCallback onPressed) {
    return SizedBox(
      child: GestureDetector(
        onTap: onPressed,
        child: SizedBox(
          width: 80,
          height: 80,
          child: Center(child: child),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Particularidades'),
        backgroundColor: Colors.yellow,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _showAlert(context, 'Para implementar 1'),
                  child: SizedBox(
                    width: 80,
                    child: index == 0
                          ? Image.asset('assets/icones_topo/ic_cabeca_normal.png')
                          : index == 1
                          ? Image.asset('assets/icones_topo/ic_focinho_normal.png')
                          : index == 2
                          ? Image.asset('assets/icones_topo/ic_pescoco_normal.png')
                          : index == 3
                          ? Image.asset('assets/icones_topo/ic_lateral_dir_normal.png')
                          : index == 4
                          ? Image.asset('assets/icones_topo/ic_lateral_esq_normal.png')
                          : index == 5
                          ? Image.asset('assets_/icones_topo/ic_membros_ant_normal.png')
                          : index == 6
                          ? Image.asset('assets/icones_topo/ic_membros_pos_normal.png')                          
                          : Text(
                              items[index],
                              textAlign: TextAlign.center,
                            ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Container(
              key: _blueContainerKey,  // Add a key to the blue container
              color: Colors.blue,
              child: Stack(
                children: [                
                  Center(                  
                    child: Image.asset('assets/icones/frente_cabeca_cavalo.png'),                  
                  ),
                  if (_showDraggableImage)
                    Positioned(
                      left: _imageOffset.dx,
                      top: _imageOffset.dy,
                      child: Draggable(
                        feedback: Image.asset('assets/marcas/ic_res_mar_estrela_losango.png'),
                        childWhenDragging: Container(),
                        onDragEnd: (details) {
                          setState(() {
                            final RenderBox renderBox = _blueContainerKey.currentContext!.findRenderObject() as RenderBox;
                            _imageOffset = renderBox.globalToLocal(details.offset);
                          });
                        },
                        child: Image.asset('assets/marcas/ic_res_mar_estrela_losango.png'),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 40,
            child: Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () => _showAlert(context, 'ic_girar_esquerda.png'),
                    child: Image.asset('assets/marcas/ic_girar_esquerda.png'),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _showAlert(context, 'ic_girar_direita.png'),
                    child: Image.asset('assets/marcas/ic_girar_direita.png'),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _showAlert(context, 'ic_desfazer.png'),
                    child: Image.asset('assets/marcas/ic_desfazer.png'),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () => _showAlert(context, 'ic_desfazer.png'),
                    child: Image.asset('assets/marcas/ic_delete.png'),
                  ),
                ],
              )
              ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _buildButton(Text('bt0'), () => _showAlert(context, 'vai la')),
                _buildButton(Text('bt2'), () {
                  setState(() {
                    _showDraggableImage = true;
                  });
                }),
                _buildButton(Image.asset('assets/marcas/ic_res_estrela_losango.png'), () {}),
                _buildButton(Text('bt4'), () => _showAlert(context, 'vaivai')),
                _buildButton(Text('bt5'), () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}