import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'character.dart';

class FavoritesService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser!.uid;

  CollectionReference get _favoritesRef =>
      _firestore.collection('users').doc(_userId).collection('favorites');

  Future<void> addFavorite(Character character) async {
    await _favoritesRef.doc(character.id.toString()).set({
      'id': character.id,
      'name': character.name,
      'status': character.status,
      'species': character.species,
      'gender': character.gender,
      'image': character.image,
      'origin': character.origin,
    });
  }

  Future<void> removeFavorite(int characterId) async {
    await _favoritesRef.doc(characterId.toString()).delete();
  }

  Future<bool> isFavorite(int characterId) async {
    final doc = await _favoritesRef.doc(characterId.toString()).get();
    return doc.exists;
  }

  Stream<List<Character>> getFavorites() {
    return _favoritesRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Character.fromFirestore(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
