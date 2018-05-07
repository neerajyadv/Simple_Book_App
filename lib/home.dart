import 'package:flutter/material.dart';
import 'package:offline_books_app/data.dart';


class Home extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      leading: IconButton(
       icon: Icon(
         Icons.menu
       ),
       onPressed: (){},
      ),
      title: Text("Books"),
      actions: <Widget>[
        IconButton(
          icon: Icon(
              Icons.search
          ),
          onPressed: (){},
        ),
      ],
    );

    createTile(Book book) => Hero(
      tag: book.title,
      child: Material(
        elevation: 10.0,
        shadowColor: Colors.yellow.shade900,
          child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, 'detail/${book.title}');
            },
            child: Image(
              image: AssetImage(book.image),
              fit: BoxFit.cover,
            ),
          ),
      ),
    );

    //book grid
    final grid = CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(8.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2/3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: books.map((book) => createTile(book)).toList(),
          ),
        )
      ],
    );


    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      body: grid,
    );
  }
}