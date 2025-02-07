import 'package:flutter/material.dart';
import 'Info/articles.dart';
import 'controller.dart';
import '../../AccountScreen/profile_page.dart';
import  '../Messages/messages_cat.dart';
import '../Notifications/notification_cat.dart';
import '../homepage.dart';

class LinkId {
  int linkId;

  LinkId(this.linkId);
}

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, required this.linkId});

  final int linkId;

  @override
  Widget build(BuildContext context) {
    List<Widget> articleWidgets = [];

    articleWidgets.add(articlePage(
      articleContents[linkId].title,
      articleContents[linkId].author,
      articleContents[linkId].imageHeader,
      articleContents[linkId].category,
      articleContents[linkId].dateOfPublishing.month,
      articleContents[linkId].dateOfPublishing.day,
      articleContents[linkId].dateOfPublishing.year,
      articleContents[linkId].colorFont,
      articleContents[linkId].colorTheme,
      articleContents[linkId].articleBody,
    ));

    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color(0xffFFF4E8),
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                iconSize: 17,
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              title: const Text(
                'Post',
                style: TextStyle(
                    fontFamily: 'RobotoSlab',
                    fontSize: 25,
                    height: 1,
                    color: Color(0xffFFF4E8)),
              ),
              centerTitle: true,
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
              backgroundColor: const Color(0xffF58216),
            ),
            floatingActionButton: InkWell(
              onTap: () {
              },
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
                height: 70,
                shape: const CircularNotchedRectangle(),
                notchMargin: 6,
                color: const Color(0xffF58216),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.home_filled),
                        color: const Color(0xffFFF4E8),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MyHomePage();
                          }));
                        },
                      ),
                      IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.notifications),
                        color: const Color(0xffFFF4E8),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return NotificationCat();
                          }));
                        },
                      ),
                      const SizedBox(width: 90),
                      IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.chat),
                        color: const Color(0xffFFF4E8),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return MessagesCat();
                          }));
                        },
                      ),
                      IconButton(
                        iconSize: 35,
                        icon: const Icon(Icons.account_circle),
                        color: const Color(0xffFFF4E8),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ProfilePage();
                          }));
                        },
                      ),
                    ])),
            body: ListView(
              children: articleWidgets,
            )));
  }
}
