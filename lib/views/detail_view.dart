// lib/views/detail_view.dart
import 'package:flutter/material.dart';
import '../models/character_data.dart';
import 'package:url_launcher/url_launcher.dart'; // Импортируйте пакет здесь

class DetailView extends StatelessWidget {
  final CharacterData characterData;

  const DetailView({Key? key, required this.characterData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(characterData.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            characterData.image != null
                ? Image.network(characterData.image!)
                : Container(height: 100, color: Colors.grey),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                characterData.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            if (characterData.wiki != null)
              TextButton(
                onPressed: () {
                  _launchURL(characterData.wiki!); // Используйте метод для открытия URL
                },
                child: const Text('Подробнее на вики'),
              ),
          ],
        ),
      ),
    );
  }

  // Метод для открытия URL
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}