import 'package:bukin_app/models/book-model.dart';
import 'package:flutter/material.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key key, this.book}) : super(key: key);

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var primaryColor = Theme.of(context).primaryColor;
    var accentColor = Theme.of(context).accentColor;
    var colorText = Theme.of(context).primaryTextTheme.body1.color;

    return SafeArea(
        child: Material(
      color: primaryColor,
      child: Column(children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.close),
            color: Color(0xff3F583A),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                style:
                    TextStyle(fontSize: 14, color: colorText.withOpacity(0.75)),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                width: double.infinity,
                height: height * 0.42,
                child: SingleChildScrollView(
                  child: Text(
                    '${book.summary}${book.summary}',
                    style: TextStyle(fontSize: 18, color: colorText),
                  ),
                ),
              ),
            ],
          ),
        ),
        Flexible(
            flex: 1,
            child: Stack(
              children: <Widget>[
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: width,
                      height: 60.0,
                      decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(59.0))),
                    )),
                Positioned(
                    bottom: 60.0,
                    right: 0,
                    child: Container(
                      width: width * 0.75,
                      height: 90.0,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(103.0)),
                        color: Color(0xff3F583A),
                      ),
                    )),
                Positioned(
                  bottom: 90,
                  left: 20,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    child: Image(
                      image: NetworkImage(book.image),
                      height: 155,
                      width: 132,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 126,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => {},
                      child: Container(
                        child: Center(
                          child: Icon(
                            Icons.star_border,
                            color: Color(0xff2E5F6B),
                            size: 36,
                          ),
                        ),
                        height: 48,
                        width: 58,
                        decoration: BoxDecoration(
                            color: Color(0xffAB9561),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24))),
                      ),
                    ))
              ],
            ))
      ]),
    ));
  }
}
