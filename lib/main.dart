import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue[800],
      hintColor: Colors.cyan[600],

      fontFamily: 'Georgia',
      appBarTheme: AppBarTheme(
        color: Colors.blue[800],
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        centerTitle: true,
        ),

      textTheme: const TextTheme(
        displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        displaySmall: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        titleLarge: TextStyle(fontSize: 20.0, color: Colors.blue),
        titleMedium: TextStyle(fontSize: 15.0, color: Colors.blue),
        titleSmall: TextStyle(fontSize: 12.0, color: Colors.blue),
      ),

      buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[800],
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          elevation: 5.0,
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 6.0,
        highlightElevation: 8.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[800]!, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue[900]!, width: 2.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelStyle: TextStyle(color: Colors.blue[800]),
        hintStyle: TextStyle(color: Colors.cyan[600]),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return MaterialApp(
      title: 'Album Ranking App',
      theme: theme,
      home: HomeScreen(),
    );
  }
}