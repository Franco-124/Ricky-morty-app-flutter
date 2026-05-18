import 'package:flutter/material.dart';
import '../../characters/models/character.dart';
import '../../characters/screens/character_detail_screen.dart';
import '../../characters/widgets/character_card.dart';
import '../services/favorites_service.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final service = FavoritesService();

    return StreamBuilder<List<Character>>(
      stream: service.getFavorites(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final favorites = snapshot.data ?? [];
        if (favorites.isEmpty) {
          return const Center(child: Text('No tenés favoritos todavía.'));
        }

        return ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final character = favorites[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        CharacterDetailScreen(character: character),
                  ),
                );
              },
              child: CharacterCard(
                name: character.name,
                status: character.status,
                species: character.species,
                imageUrl: character.image,
              ),
            );
          },
        );
      },
    );
  }
}
