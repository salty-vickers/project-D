import 'package:flutter/material.dart';
import '../models/card_data.dart';

class DetailView extends StatelessWidget {
  final CardData cardData;

  const DetailView({Key? key, required this.cardData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cardData.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(cardData.imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                cardData.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Здесь можно добавить дополнительную информацию о карточке.
          ],
        ),
      ),
    );
  }
}
