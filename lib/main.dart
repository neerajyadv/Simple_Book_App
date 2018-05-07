import 'package:flutter/material.dart';
import 'package:offline_books_app/data.dart';
import 'package:offline_books_app/details.dart';
import 'package:offline_books_app/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: new Home(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }

  generateRoute(RouteSettings settings)
  {
    final path = settings.name.split('/');
    final title = path[1];

    Book book = books.firstWhere((it) => it.title == title);
    return MaterialPageRoute(
      settings: settings,
        builder: (context) =>  new Detail(book)
    );
  }
}

