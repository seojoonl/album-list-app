import 'package:flutter/material.dart';
import 'album.dart';

class AddAlbumScreen extends StatefulWidget {
  @override
  _AddAlbumScreenState createState() => _AddAlbumScreenState();
}

class _AddAlbumScreenState extends State<AddAlbumScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _artist = '';
  String _coverImageUrl = '';
  List<String> _favoriteTracks = [];

  void _addAlbum() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final newAlbum = Album(
        name: _name,
        artist: _artist,
        coverImageUrl: _coverImageUrl,
        favoriteTracks: _favoriteTracks,
      );
      Navigator.pop(context, newAlbum);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Album')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Album Name'),
              onSaved: (value) => _name = value!,
              validator: (value) => value!.isEmpty ? 'Please enter an album name' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Artist'),
              onSaved: (value) => _artist = value!,
              validator: (value) => value!.isEmpty ? 'Please enter the artist name' : null,
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Cover Image URL'),
              onSaved: (value) => _coverImageUrl = value!,
              validator: (value) => value!.isEmpty ? 'Please enter the cover image URL' : null,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addAlbum,
              child: const Text('Add Album'),
            ),
          ],
        ),
      ),
    );
  }
}