import 'package:bukin_app/models/book-model.dart';
import 'package:bukin_app/models/mocks.dart';
import 'package:bukin_app/pages/book-detail/components/book-detail-page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var backgroundColor = Theme.of(context).backgroundColor;
    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(59.0)),
          child: Container(
            color: accentColor,
            height: 60,
          ),
        ),
      ),
      body: Center(
          child: CarouselSlider.builder(
        itemCount: bookList.length,
        itemBuilder: (context, index) {
          return Builder(
            builder: (BuildContext context) {
              return BookCardItem(
                book: bookList[index],
              );
            },
          );
        },
        options: CarouselOptions(
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            aspectRatio: 0.8),
      )),
    );
  }
}

class BookCardItem extends StatelessWidget {
  const BookCardItem({Key key, @required this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;

    var colorText = Theme.of(context).primaryTextTheme.body1.color;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
        color: primaryColor,
      ),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BookDetailPage(book: book))),
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 20, top: 77, end: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    child: Image(                      
                      image: NetworkImage(book.image, ),
                      height: 155,
                      width: 132,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Spacer(),
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: book.name,
                          style: TextStyle(fontSize: 24, color: colorText)),
                      TextSpan(
                          text: '  (${book.year})',
                          style: TextStyle(
                              fontSize: 10, color: colorText.withOpacity(0.5))),
                    ]),
                  ),
                  Text(
                    '${book.author}',
                    style: TextStyle(
                        fontSize: 14, color: colorText.withOpacity(0.75)),
                    textAlign: TextAlign.left,
                  ),
                  Spacer(),
                  Text(
                    '${book.summary}',
                    style: TextStyle(fontSize: 18, color: colorText),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 100,
              right: 0,
              child: Container(
                height: 48,
                width: 58,
                decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24))),
              ))
        ],
      ),
    );
  }
}
