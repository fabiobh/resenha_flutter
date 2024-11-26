// fotos_v2.dart
import 'package:flutter/material.dart';

class FotosV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resenha Virtual Equídeos'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fotos do Animal',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Toque na imagem para Tirar ou Excluir a foto',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 16),
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(4, (index) {
                return Container(
                  margin: EdgeInsets.all(8.0),
                  color: Colors.grey[300],
                  child: Center(
                    child: Icon(
                      Icons.image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}