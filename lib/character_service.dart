import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character.dart';

class CharacterService {
  static const String _baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<List<Character>> getCharacters({int page = 1}) async {
    final url = Uri.parse('$_baseUrl?page=$page');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List results = data['results'];
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters: ${response.statusCode}');
    }
  }
}
