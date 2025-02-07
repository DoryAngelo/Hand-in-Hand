import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'Articles/article_details.dart';
import 'Articles/fundraiser_cat.dart';
import 'Articles/oncall_cat.dart';
import 'Articles/volunteer_cat.dart';
import 'Articles/Info/articles.dart';
import 'Articles/controller.dart';
import 'Notifications/notification_cat.dart';
import 'Messages/messages_cat.dart';
import '../AccountScreen/profile_page.dart';
import '../LoginScreen/login_screen.dart';
import 'Articles/developers.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget highlightsCarousel = Padding(
      padding: EdgeInsets.all(10),
      child: CarouselSlider.builder(
          itemCount: 3,
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
          ),
          itemBuilder: (ctx, index, realIdx) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                    image: AssetImage('assets/images/carousel_$index.png')));
          }),
    );

    Widget header = Container(
      margin: EdgeInsets.only(top: 5,bottom:10),
      alignment: Alignment.bottomLeft,
      child: Column(
        children: const [
          Divider(
            color: Color(0xffF58216),
            thickness: 5,
          ),

          Center(
            child: Text(
              "Discover",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoSlab',
                fontSize: 37.0,
              ),
            ),
          ),

          Divider(
            color: Color(0xffF58216),
            thickness: 5,
          ),
        ],
      )
    );

    Widget explore = Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 30,
                      height: 1,
                      color: Color(0xffF58216)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(width: 10),
                  InkWell(
                      child: Container(
                          width: 140,
                          height: 210,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xff56B858)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    child: Image(
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(
                                            'assets/images/placer.png'))),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                'assets/images/fundraisers_icon.png'),
                                            height: 40,
                                            width: 40),
                                        Text(
                                          'Fundraisers',
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 20,
                                              height: 1,
                                              color: Color(0xffFFF4E8)),
                                        ),
                                        Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                                                ' Nunc nec lectus id augue viverra sodales nec eget odio.'
                                                ' Nam hendrerit tellus et enim condimentum, ac ultrices felis ullamcorper.'
                                                ' In vitae convallis leo, ac accumsan neque.',
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 8,
                                                height: 1.3,
                                                color: Color(0xffFFF4E8)))
                                      ]),
                                ),
                              ),
                            ],
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FundraiserCategory()));
                      }),
                  SizedBox(width: 10),
                  InkWell(
                    child: Container(
                        width: 140,
                        height: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Color(0xff039AEA)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                  child: Image(
                                      fit: BoxFit.fitHeight,
                                      image: AssetImage(
                                          'assets/images/placer.png'))),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Image(
                                          image: AssetImage(
                                              'assets/images/volunteer_icon.png'),
                                          height: 40,
                                          width: 40),
                                      Text(
                                        'Volunteer',
                                        style: TextStyle(
                                            fontFamily: 'RobotoSlab',
                                            fontSize: 20,
                                            height: 1,
                                            color: Color(0xffFFF4E8)),
                                      ),
                                      Text(
                                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                                              ' Nunc nec lectus id augue viverra sodales nec eget odio.'
                                              ' Nam hendrerit tellus et enim condimentum, ac ultrices felis ullamcorper.'
                                              ' In vitae convallis leo, ac accumsan neque.',
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 8,
                                              height: 1.3,
                                              color: Color(0xffFFF4E8)))
                                    ]),
                              ),
                            ),
                          ],
                        )),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VolunteerCategory()));
                    },
                  ),
                  SizedBox(width: 10),
                  InkWell(
                      child: Container(
                          width: 140,
                          height: 210,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Color(0xffCC3434)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                    child: Image(
                                        fit: BoxFit.fitHeight,
                                        image: AssetImage(
                                            'assets/images/placer.png'))),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                'assets/images/oncall_icon.png'),
                                            height: 40,
                                            width: 40),
                                        Text(
                                          'Be On-Call',
                                          style: TextStyle(
                                              fontFamily: 'RobotoSlab',
                                              fontSize: 20,
                                              height: 1,
                                              color: Color(0xffFFF4E8)),
                                        ),
                                        Text(
                                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                                                ' Nunc nec lectus id augue viverra sodales nec eget odio.'
                                                ' Nam hendrerit tellus et enim condimentum, ac ultrices felis ullamcorper.'
                                                ' In vitae convallis leo, ac accumsan neque.',
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 8,
                                                height: 1.3,
                                                color: Color(0xffFFF4E8)))
                                      ]),
                                ),
                              ),
                            ],
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OnCallCategory()));
                      }),
                  SizedBox(width: 10),
                ]),
          ),
        ],
      ),
    );

    Widget radarHeader = Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Text(
        'On your radar',
        style: TextStyle(
            fontFamily: 'RobotoSlab',
            fontSize: 30,
            height: 1,
            color: Color(0xffF58216)),
      ),
    );

    List<Widget> homepageWidgets = [];

    homepageWidgets.add(header);
    homepageWidgets.add(highlightsCarousel);
    homepageWidgets.add(explore);
    homepageWidgets.add(radarHeader);

    for (var i = 0; i < articleContents.length; i++) {
      homepageWidgets.add(InkWell(
          child: post(
              articleContents[i].title,
              articleContents[i].author,
              articleContents[i].imageHeader,
              articleContents[i].articleBody,
              i),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArticleDetails(
                      linkId: i,
                    )));
          }));
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFF4E8),
      drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xffF58216),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Hand-in-Hand',
                      style: TextStyle(
                          fontFamily: 'RobotoSlab',
                          fontSize: 30,
                          height: 1,
                          color: Color(0xffFFF4E8)),
                    ),
                  ],
                )),
            ListTile(
                title: const Text(
                  'Homepage',
                  style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 30,
                      height: 1,
                      color: Color(0xffF58216)),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => MyHomePage()));
                }),
            ListTile(
                title: const Text(
                  'Fundraisers',
                  style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 30,
                      height: 1,
                      color: Color(0xffF58216)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FundraiserCategory()));
                }),
            ListTile(
                title: const Text(
                  'Volunteer',
                  style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 30,
                      height: 1,
                      color: Color(0xffF58216)),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VolunteerCategory()));
                }),
            Divider(
              color: Color(0xffF58216),
              thickness: 5,
            ),
            ListTile(
                title: const Text(
                  'About Us',
                  style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 30,
                      height: 1,
                      color: Color(0xffF58216)),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Developers()));
                }),
            Divider(
              color: Color(0xffF58216),
              thickness: 5,
            ),
            ListTile(
                title: const Text(
                  'Log Out',
                  style: TextStyle(
                      fontFamily: 'RobotoSlab',
                      fontSize: 30,
                      height: 1,
                      color: Color(0xffF58216)),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreenState()));
                }),
          ])),
      appBar: AppBar(
        elevation: 0,
        /*leading: IconButton(
          iconSize: 17,
          icon: const Icon(Icons.menu),
          onPressed: () {
          },
        ),*/
        title: const Text(
          'Hand-in-Hand',
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          height: 70,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6,
          color: const Color(0xffF58216),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
        children: homepageWidgets,
      ),
    );
  }
}