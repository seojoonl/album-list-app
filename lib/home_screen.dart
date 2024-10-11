import 'package:flutter/material.dart';
import 'album.dart';
import 'add_album_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Album> albums = [];

  void _navigateToAddAlbumScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddAlbumScreen()),
    ) as Album?;
    if (result != null) {
      setState(() {
        albums.add(result);
      });
    }
  }
  void _deleteAlbum(int index) {
    setState(() {
      albums.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Rankings'),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: ReorderableListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return ListTile(
            key: ValueKey(albums[index]),
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("#${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(width: 10),
                Image.network(albums[index].coverImageUrl, width: 50),
              ],
            ),
            title: Text(albums[index].name),
            subtitle: Text(albums[index].artist),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _deleteAlbum(index),
                ),
                const SizedBox(width: 20),
              ],
            ),
            onTap: () => _navigateToDetailScreen(albums[index]),
          );
        },
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final Album item = albums.removeAt(oldIndex);
            albums.insert(newIndex, item);
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddAlbumScreen,
        tooltip: 'Add Album',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToDetailScreen(Album album) async {
    final updatedAlbum = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumDetailScreen(album: album),
      ),
    );

    if (updatedAlbum != null) {
      setState(() {
        int index = albums.indexWhere((a) => a.name == updatedAlbum.name && a.artist == updatedAlbum.artist);
        if (index != -1) {
          albums[index] = updatedAlbum;
        }
      });
    }
  }
}