class CharacterData {
  final String id;
  final String name;
  final String? image;
  final String? wiki;

  CharacterData({
    required this.id,
    required this.name,
    this.image,
    this.wiki,
  });

  factory CharacterData.fromJson(Map<String, dynamic> json) {
    final attributes = json['attributes'];
    return CharacterData(
      id: json['id'],
      name: attributes['name'],
      image: attributes['image'],
      wiki: attributes['wiki'],
    );
  }
}