import 'package:flutter/material.dart';

class FotosScreen extends StatelessWidget {
  const FotosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fotos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Galeria de Fotos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 9, // Example item count
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.photo,
                      size: 50,
                      color: Colors.grey[700],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
