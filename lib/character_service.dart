import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character.dart';

class CharacterService {
  static const String _baseUrl = 'https://rickandmortyapi.com/api/character';

  Future<Map<String, dynamic>> getCharacters({
    int page = 1,
    String? name,
    String? status,
  }) async {
    final params = <String, String>{'page': '$page'};
    if (name != null && name.isNotEmpty) params['name'] = name;
    if (status != null && status.isNotEmpty) params['status'] = status;

    final url = Uri.parse(_baseUrl).replace(queryParameters: params);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final results = data['results'] as List;
      final info = data['info'] as Map<String, dynamic>;
      return {
        'characters': results.map((j) => Character.fromJson(j)).toList(),
        'hasMore': info['next'] != null,
      };
    } else if (response.statusCode == 404) {
      return {'characters': <Character>[], 'hasMore': false};
    } else {
      throw Exception('Error al cargar personajes: ${response.statusCode}');
    }
  }
}
