import 'package:flutter/material.dart';
import 'album.dart';

class EditAlbumScreen extends StatefulWidget {
  final Album album;

  const EditAlbumScreen({Key? key, required this.album}) : super(key: key);

  @override
  _EditAlbumScreenState createState() => _EditAlbumScreenState();
}

class _EditAlbumScreenState extends State<EditAlbumScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _artistController;
  late TextEditingController _coverImageUrlController;
  late TextEditingController _trackController;
  late List<String> _favoriteTracks;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.album.name);
    _artistController = TextEditingController(text: widget.album.artist);
    _coverImageUrlController = TextEditingController(text: widget.album.coverImageUrl);
    _trackController = TextEditingController();
    _favoriteTracks = List.from(widget.album.favoriteTracks);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _artistController.dispose();
    _coverImageUrlController.dispose();
    _trackController.dispose();
    super.dispose();
  }

  void _saveAlbum() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context, widget.album.copyWith(
        name: _nameController.text,
        artist: _artistController.text,
        coverImageUrl: _coverImageUrlController.text,
        favoriteTracks: _favoriteTracks,
      ));
    }
  }

  Widget _buildFavoriteTracksList() {
    return Column(
      children: _favoriteTracks.map((track) => ListTile(
        title: Text(track),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            setState(() {
              _favoriteTracks.remove(track);
            });
          },
        ),
      )).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Album'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Album Name'),
              validator: (value) => value!.isEmpty ? 'Please enter an album name' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _artistController,
              decoration: const InputDecoration(labelText: 'Artist'),
              validator: (value) => value!.isEmpty ? 'Please enter the artist name' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _coverImageUrlController,
              decoration: const InputDecoration(labelText: 'Cover Image URL'),
              validator: (value) => value!.isEmpty ? 'Please enter the cover image URL' : null,
            ),
            const SizedBox(height: 20),
            Text('Favorite Tracks:', style: Theme.of(context).textTheme.titleLarge),
            _buildFavoriteTracksList(),
            const SizedBox(height: 10),
            TextFormField(
              controller: _trackController,
              decoration: const InputDecoration(labelText: 'Add New Track'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_trackController.text.isNotEmpty) {
                  setState(() {
                    _favoriteTracks.add(_trackController.text);
                    _trackController.clear();
                  });
                }
              },
              child: const Text('Add Track'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveAlbum,
              child: const Text('Save Changes'),
            ),
          ]
        ),
      ),
    );
  }
}