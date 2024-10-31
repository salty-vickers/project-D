import 'package:flutter/material.dart';
import '../models/card_data.dart';
import 'detail_view.dart';

class CardWidget extends StatefulWidget {
  final CardData cardData;

  const CardWidget({Key? key, required this.cardData}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    final snackBar = SnackBar(
      content: Text(isLiked ? 'Добавлено в избранное' : 'Удалено из избранного'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _navigateToDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailView(cardData: widget.cardData),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _navigateToDetail,
      child: Card(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.network(widget.cardData.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.cardData.title,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
              ),
              onPressed: _toggleLike,
            ),
          ],
        ),
      ),
    );
  }
}
