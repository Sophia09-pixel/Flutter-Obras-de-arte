import 'package:flutter/material.dart';
import 'package:obras_de_arte/data/local/repository/artwork_repository.dart';
import 'package:obras_de_arte/data/local/repository/artwork_repository_impl.dart';
import 'package:obras_de_arte/data/models/artwork.dart';
import 'package:obras_de_arte/widget/artwork_list_item.dart';

class TabHome extends StatefulWidget {
  const TabHome({super.key});
  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  late final ArtworkRepository _repository;
  late Future<List<Artwork>> _artworksFuture;
  @override
  void initState() {
    super.initState();
    _repository = ArtworkRepositoryImpl();
    _artworksFuture = _repository.fetchArtworks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Artwork>>(
      future: _artworksFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar obras'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhuma obra encontrada'));
        } else {
          // Código da construção da lista no próximo
          final artworks = snapshot.data!;
          return ListView.builder(
            itemCount: artworks.length,
            itemBuilder: (context, index) {
              final art = artworks[index];
              return ArtworkListItem(artwork: art);
            },
          );
        }
      },
    );
  }
}
