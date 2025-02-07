import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';
import 'Info/source.dart';

Widget post(String title, String author, String imageHeader,
    List<ArticleBody> articleBody, int id) {
  var i = 0;
  String? previewText;
  do {
    previewText = articleBody[i].paragraph;
    i++;
  } while (previewText == null);

  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: FractionallySizedBox(
        widthFactor: 0.94,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffF58216),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 400,
          child: Column(children: <Widget>[
            Stack(children: <Widget>[
              // image, title, profile picture and op name

              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                child: Image(
                    fit: BoxFit.fitHeight,
                    height: 330,
                    image: AssetImage(imageHeader)),
              ),

              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 294,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(author,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                              color: Color(0xffFFF4E8))),
                      Text(
                        title.toTitleCase!,
                        style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w900,
                            fontSize: 50,
                            height: 1,
                            color: Color(0xffFFF4E8)),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10, 20, 10),
                child: Text(
                  previewText,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 11,
                      height: 1.3,
                      color: Color(0xffFFF4E8)),
                ),
              ),
            )
          ]),
        )),
  );
}

Widget articlePage(
    String title,
    String author,
    String imageHeader,
    String category,
    String month,
    int day,
    int year,
    Color colorFont,
    Color colorTheme,
    List<ArticleBody> articleBody) {
  List<Widget> articleWidgets = [];

  articleWidgets.add(
    Text(
      '$title',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontFamily: 'RobotoSlab', fontSize: 40, height: 1, color: colorFont),
    ),
  );

  articleWidgets.add(
      Container(
        margin: EdgeInsets.only(top:5),
        alignment: Alignment.bottomLeft,
        child: Column(
          children: [
            Text('Published $month $day, $year by $author'),
            Container(
              margin: EdgeInsets.only(top:20, bottom: 15, left:125, right:125),
                height: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: colorTheme),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                        child: Image(
                          height: 15,
                          width: 15,
                          image: AssetImage(
                              'assets/images/${category}_icon.png'),
                        ),
                      ),
                      SizedBox(width: 3),
                      Text(
                        '$category'.toTitleCase!,
                        style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            height: 1,
                            fontSize: 13,
                            color: Color(0xffFFF4E8)),
                      ),
                    ]
                ),
            ),
            Divider(
              color: Color(0xffF58216),
              thickness: 5,
            ),
          ],
        ),
      )
  );

  if (category == 'fundraisers') {
    articleWidgets.add(Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Donate with',
              style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 20,
                  height: 1,
                  color: Color(0xff283E0C)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: <Color>[
                                Color(0xff002F86),
                                Color(0xff009CDE)
                              ])),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/paypal_logo.png')),
                            ),
                          ]))),
              SizedBox(width: 10),
              Expanded(
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xff002CB9)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/gcash_logo.png')),
                            )
                          ]))),
              SizedBox(width: 10),
              Expanded(
                  child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color(0xffF48116)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Bank Transfer',
                                  style: TextStyle(
                                      fontFamily: 'RobotoSlab',
                                      color: Color(0xffFFF4E8)))
                            ]),
                      )))
            ],
          )
        ],
      ),
    ));
  } else {
    articleWidgets.add(
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          children: [
            Expanded(
                child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff039AEA)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                              image:
                                  AssetImage('assets/images/signup_logo.png')),
                          SizedBox(
                            width: 5,
                          ),
                          Text('Sign up for this project',
                              style: TextStyle(
                                fontFamily: 'RobotoSlab',
                                fontSize: 18,
                                color: Color(0xffFFF4E8),
                              ))
                        ],
                      ),
                    ))),
          ],
        ),
      ),
    );
  }

  articleWidgets.add(Padding(
    padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            'Share to',
            style: TextStyle(
                fontFamily: 'RobotoSlab',
                fontSize: 20,
                height: 1,
                color: Color(0xff283E0C)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color(0xff000000)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image(
                                image: AssetImage('assets/images/x_logo.png')),
                          ),
                        ]))),
            SizedBox(width: 10),
            Expanded(
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color(0xff0078F6)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Image(
                                image: AssetImage(
                                    'assets/images/facebook_logo.png')),
                          )
                        ]))),
            SizedBox(width: 10),
            Expanded(
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Color(0xffF48116)),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Copy Link',
                                style: TextStyle(
                                    fontFamily: 'RobotoSlab',
                                    color: Color(0xffFFF4E8)))
                          ]
                      ),
                    )
                )
            )
          ],
        )
      ],
    ),
  ));

  for (var i = 0; i < articleBody.length; i++) {
    if (articleBody[i].subtitle != null) {
      articleWidgets.add(
        Divider(
          color: Color(0xffF58216),
          thickness: 5,
        ),
      );
      articleWidgets.add(Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          articleBody[i].subtitle!,
          style: TextStyle(
              fontFamily: 'RobotoSlab',
              fontSize: 20,
              height: 1,
              color: colorFont),
        ),
      ));
    }
    if (articleBody[i].paragraph != null) {
      articleWidgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            articleBody[i].paragraph!,
            style: TextStyle(
                fontFamily: 'Roboto',
                fontSize: 10,
                height: 1.5,
                color: colorFont),
          ),
        ),
      );
    }
    if (articleBody[i].image != null) {
      articleWidgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(image: AssetImage('assets/images/placer.png')),
          ),
        ),
      );
    }
  }

  articleWidgets.add(
    Divider(
      color: Color(0xffF58216),
      thickness: 5,
    ),
  );

  return Column(
    children: [
      FractionallySizedBox(
          widthFactor: 1,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image(fit: BoxFit.fitHeight, image: AssetImage(imageHeader)),
          )),
      Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: articleWidgets),
      ),
    ],
  );
}
