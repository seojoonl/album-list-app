import 'package:flutter/material.dart';
import 'album.dart';
import 'edit_album_screen.dart';

class AlbumDetailScreen extends StatefulWidget {
  final Album album;

  const AlbumDetailScreen({Key? key, required this.album}) : super(key: key);

  @override
  _AlbumDetailScreenState createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends State<AlbumDetailScreen> {
  late Album album;

  @override
  void initState() {
    super.initState();
    album = widget.album;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        Navigator.pop(context, album);
        },
      child: Scaffold(
        appBar: AppBar(
          title: Text(album.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(album.coverImageUrl),
              const SizedBox(height: 16),
              Text('Artist: ${album.artist}', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text('Favorite Tracks:', style: Theme.of(context).textTheme.titleLarge),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: album.favoriteTracks
                    .map((track) => Text(track, style: Theme.of(context).textTheme.titleMedium))
                    .toList(),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final updatedAlbum = await Navigator.push<Album>(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAlbumScreen(album: album),
                    ),
                  );
                  if (updatedAlbum != null) {
                    setState(() {
                      album = updatedAlbum;
                    });
                  }
                },
                child: const Text('Edit Album'),
              ),
            ],
          ),
        ),
      )
    );
  }
}