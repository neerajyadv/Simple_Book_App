import 'package:offline_books_app/data.dart';
import 'package:flutter/material.dart';
import 'rating_bar.dart';

class Detail extends StatelessWidget
{

  final Book book;

  Detail(this.book);

  @override
  Widget build(BuildContext context) {

    final appBar = AppBar(
      elevation: .5,
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


    //details of book image and pages
    //same as topLeft
    final bookImageandPages = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: book.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.redAccent,
              child: Image(
                image: AssetImage(
                  book.image
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );

    //topRight
    final topDetails = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        text(book.title, size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text('by ${book.writer}', color: Colors.black54, isBold: false, padding: EdgeInsets.only(top: 8.0, bottom: 8.0)),
        Row(
          children: <Widget>[
            text(
                book.price,
                isBold: true,
                padding: EdgeInsets.only(
                    right: 8.0 )
            ),
            RatingBar(
              rating: book.rating),
          ],
        ),
        SizedBox(height: 32.0,),
        Container(
          padding: EdgeInsets.only(bottom: 8.0),
          child: text('Pages: ${book.pages} pages', isBold: true, color: Colors.black38, size: 12),
        ),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          elevation: 5.0,
          child: MaterialButton(
            color: Colors.purpleAccent,
            child: text("Buy Now", color: Colors.white, size: 13),
            onPressed: () {},
          ),
        )
      ],
    );

    final topContent = Container(
      color: Theme.of(context).primaryColor,
      padding: EdgeInsets.only(bottom: 16.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: bookImageandPages),
          Flexible(flex: 3, child: topDetails)
        ],
      ),
    );

    //description
    final bookDescription = Container(
      height: 290.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Text(
          book.description,
          style: TextStyle(fontSize: 12.0,height: 1.5),
        ),
      ),
    );



    return new Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[
          topContent,
          bookDescription
        ],
      ),
    );
  }

  //creating text widget
  text(String data, {
    Color color = Colors.black87,
    num size = 14,
  EdgeInsetsGeometry padding = EdgeInsets.zero,
  bool isBold = false}) =>
      Padding(
        padding: padding,
        child: Text(data,
        style: TextStyle(
          color: color,
          fontSize: size.toDouble(),
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal
        ),),
      );

}