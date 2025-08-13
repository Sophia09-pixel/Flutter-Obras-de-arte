import 'package:obras_de_arte/data/models/artwork.dart';

abstract class ArtworkRepository {
  Future<List<Artwork>> fetchArtworks();
}
