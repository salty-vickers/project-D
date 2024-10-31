import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Салманов М.А. | ВТАСбзу-21'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    // Здесь мы создаем список карточек с текстовыми данными и изображениями.
    List<CardData> cardDataList = [
      CardData(title: 'Кольцо Каджита', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/7/78/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%A5%D0%B0%D0%B4%D0%B6%D0%B8%D1%82%D0%B0_%28TES_4_Oblivion%29.png/revision/latest?cb=20221005175252&path-prefix=ru'),
      CardData(title: 'Луна-и-Звезда', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/5/52/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%9B%D1%83%D0%BD%D0%B0-%D0%B8-%D0%97%D0%B2%D0%B5%D0%B7%D0%B4%D0%B0.png/revision/latest?cb=20130421112526&path-prefix=ru'),
      CardData(title: 'Кольцо Учителя', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/1/13/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%A3%D1%87%D0%B8%D1%82%D0%B5%D0%BB%D1%8F.png/revision/latest?cb=20170429192222&path-prefix=ru'),
      CardData(title: 'Кольцо Финастера', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/2/2a/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%A4%D0%B8%D0%BD%D0%B0%D1%81%D1%82%D0%B5%D1%80%D0%B0_%28TESIII%29.png/revision/latest?cb=20130427140902&path-prefix=ru'),
      CardData(title: 'Кольцо Чернокнижника', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/9/97/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%A7%D0%B5%D1%80%D0%BD%D0%BE%D0%BA%D0%BD%D0%B8%D0%B6%D0%BD%D0%B8%D0%BA%D0%B0_%28TES_3_Morrowind%29.png/revision/latest?cb=20130427143815&path-prefix=ru'),
      CardData(title: 'Кольцо Азуры', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/e/e4/%D0%98%D0%B7%D1%8F%D1%89%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_01_TESIII.png/revision/latest?cb=20190327125218&path-prefix=ru'),
      CardData(title: 'Вампирическое кольцо', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/5/55/%D0%92%D0%B0%D0%BC%D0%BF%D0%B8%D1%80%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BB%D1%8C%D1%86%D0%BE.jpg/revision/latest?cb=20170812170125&path-prefix=ru'),
      CardData(title: 'Кольцо ветра', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/b/bb/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%92%D0%B5%D1%82%D1%80%D0%B0.png/revision/latest?cb=20130428095620&path-prefix=ru'),
      CardData(title: 'Кольцо Намиры', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/5/5f/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%9D%D0%B0%D0%BC%D0%B8%D1%80%D1%8B_%D0%A1%D0%BA%D0%B0%D0%B9%D1%80%D0%B8%D0%BC.png/revision/latest?cb=20130210225042&path-prefix=ru'),
      CardData(title: 'Кольцо Хирсина', imageUrl: 'https://static.wikia.nocookie.net/elderscrolls/images/5/51/%D0%9A%D0%BE%D0%BB%D1%8C%D1%86%D0%BE_%D0%A5%D0%B8%D1%80%D1%81%D0%B8%D0%BD%D0%B0_%28Skyrim%29.png/revision/latest?cb=20220402160756&path-prefix=ru'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: cardDataList.length,
        itemBuilder: (context, index) {
          return CardWidget(cardData: cardDataList[index]);
        },
      ),
    );
  }
}

class CardData {
  final String title;
  final String imageUrl;

  CardData({required this.title, required this.imageUrl});
}

class CardWidget extends StatelessWidget {
  final CardData cardData;

  const CardWidget({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image.network(cardData.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cardData.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
