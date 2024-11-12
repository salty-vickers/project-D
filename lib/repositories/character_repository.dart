// lib/repositories/character_repository.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character_data.dart';

class CharacterRepository {
  final String baseUrl = 'https://api.potterdb.com/v1/characters';

  Future<List<CharacterData>> fetchCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> charactersJson = data['data'];
      return charactersJson
          .map((json) => CharacterData.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}
