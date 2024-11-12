// lib/views/card-widget.dart
import 'package:flutter/material.dart';
import '../models/character_data.dart';
import 'detail_view.dart';

class CardWidget extends StatelessWidget {
  final CharacterData characterData;

  const CardWidget({Key? key, required this.characterData}) : super(key: key);

  void _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailView(characterData: characterData), // Убедитесь, что здесь передан characterData
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            characterData.image != null
                ? Image.network(characterData.image!)
                : Container(height: 100, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                characterData.name,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
