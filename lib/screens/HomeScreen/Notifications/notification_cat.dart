import 'package:flutter/material.dart';
import '../Messages/data.dart';
import '../Messages/messages_cat.dart';
import '../homepage.dart';
import '../Articles/fundraiser_cat.dart';
import '../Articles/volunteer_cat.dart';
import '../../AccountScreen/profile_page.dart';
import '../../LoginScreen/login_screen.dart';
import '../Articles/developers.dart';


class NotificationCat extends StatefulWidget {
  @override
  _NotificationCatState createState() => _NotificationCatState();
}


class _NotificationCatState extends State<NotificationCat> {
  @override
  Widget build(BuildContext context) {

    bool isEqualTwo = false;

    Widget header = Container(
      margin: EdgeInsets.only(top:20, left: 15, bottom: 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Notifications",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                  fontSize: 37.0,
                ),
              ),
              Spacer(),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.blue,
                ),
                margin: EdgeInsets.only(right: 15),
                padding: EdgeInsets.all(10),
                child: Container(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );


    List<Widget> myWidgets = [header];

    for(int i = 1; i <= 3; i++){
      if (i == 2){
        isEqualTwo = true;
      }
      else {
        isEqualTwo = false;
      }
      myWidgets.add(
          InkWell(
            onTap: () {
            },
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                color: Color(0xFFFFD8AA),
              ),
              padding:  const EdgeInsets.all(7),
              margin: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          sourceIcons[i],
                          color: Colors.brown,
                          size: 25.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15, top:3,),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 15, // Image radius
                                backgroundImage: isEqualTwo
                                    ? AssetImage(sourceImages[1].toString())
                                    : null,
                              ),
                              Container(
                                margin: isEqualTwo
                                    ? EdgeInsets.only(right:50)
                                    : null,
                                child: CircleAvatar(
                                  radius: 15, // Image radius
                                  backgroundImage: isEqualTwo
                                      ? AssetImage(sourceImages[3].toString())
                                      : null,
                                ),
                              ),
                              Container(
                                margin: isEqualTwo
                                    ? EdgeInsets.only(right:100)
                                    : null,
                                child: CircleAvatar(
                                  radius: 15, // Image radius
                                  backgroundImage: isEqualTwo
                                      ? AssetImage(sourceImages[2].toString())
                                      : AssetImage(sourceImages[i].toString()),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.more_vert,
                          color: Colors.brown,
                          size: 25.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50, top:3, bottom:5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Row(
                            children: [
                              Text(
                                sourceFirstNames[i].toString(),
                                style: const TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                sourceActions[i].toString(),
                                style: const TextStyle(
                                  color: Color(0xFF8B4513),
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'RobotoSlab',
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              sourceNotifs[i].toString(),
                              style:  TextStyle(
                                color: Color(0xFF8B4513),
                                fontFamily: 'Roboto',
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                sourceTime[i].toString(),
                                style:  TextStyle(
                                  color: Color(0xFF8B4513),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xffFFF4E8),
      resizeToAvoidBottomInset: false,
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
        children:
        myWidgets,
      ),
    );
  }
}

