import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:obras_de_arte/data/local/repository/artwork_repository.dart';
import 'package:obras_de_arte/data/models/artwork.dart';

class ArtworkRepositoryImpl implements ArtworkRepository {
  final String jsonPath;
  ArtworkRepositoryImpl({this.jsonPath = 'assets/data/artworks.json'});
  @override
  Future<List<Artwork>> fetchArtworks() async {
    final jsonString = await rootBundle.loadString(jsonPath);
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Artwork.fromJson(json)).toList();
  }
}
