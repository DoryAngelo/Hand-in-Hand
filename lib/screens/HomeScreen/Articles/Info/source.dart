import 'package:flutter/material.dart';

class Date {
  int day;
  int year;
  late String month;

  Date(this.day, int month, this.year) {
    switch (month) {
      case 1:
        this.month = 'Jan.';
        break;
      case 2:
        this.month = 'Feb.';
        break;
      case 3:
        this.month = 'Mar.';
        break;
      case 4:
        this.month = 'Apr.';
        break;
      case 5:
        this.month = 'May';
        break;
      case 6:
        this.month = 'June';
        break;
      case 7:
        this.month = 'July';
        break;
      case 8:
        this.month = 'Aug.';
        break;
      case 9:
        this.month = 'Sept.';
        break;
      case 10:
        this.month = 'Oct.';
        break;
      case 11:
        this.month = 'Nov.';
        break;
      case 12:
        this.month = 'Dec.';
        break;
    }
  }
}

class ArticleBody {
  String? subtitle;
  String? paragraph;
  String? image;

  ArticleBody(this.subtitle, this.paragraph, this.image);
  ArticleBody.noImage(this.subtitle, this.paragraph);
  ArticleBody.imageOnly(this.image);
  ArticleBody.paragraphOnly(this.paragraph);
}

class ArticleContents {
  String title;
  String author;
  late Color colorTheme;
  late Color colorFont;
  late String category;
  Date dateOfPublishing;
  String imageHeader;
  List<ArticleBody> articleBody;

  ArticleContents.fundraiser(this.title, this.author, this.dateOfPublishing,
      this.imageHeader, this.articleBody) {
    this.colorTheme = Color(0xff56B858);
    this.colorFont = Color(0xff283E0C);
    this.category = 'fundraisers';
  }

  ArticleContents.volunteer(this.title, this.author, this.dateOfPublishing,
      this.imageHeader, this.articleBody) {
    this.colorTheme = Color(0xff039AEA);
    this.colorFont = Color(0xff004265);
    this.category = 'volunteer';
  }
}
