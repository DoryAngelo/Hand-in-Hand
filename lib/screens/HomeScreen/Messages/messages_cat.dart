import 'package:flutter/material.dart';
import 'messages.dart';
import 'data.dart';
import '../homepage.dart';
import '../Notifications/notification_cat.dart';
import '../Articles/fundraiser_cat.dart';
import '../Articles/volunteer_cat.dart';
import '../../AccountScreen/profile_page.dart';
import '../../LoginScreen/login_screen.dart';
import '../Articles/developers.dart';


class MessagesCat extends StatefulWidget {
  @override
  _MessagesCatState createState() => _MessagesCatState();
}


class _MessagesCatState extends State<MessagesCat> {
  @override
  Widget build(BuildContext context) {

    Widget header = Container(
      margin: EdgeInsets.only(top:20, left: 15, bottom: 20),
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Messages",
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
                        Icons.add,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:10,right: 5),
                        child: Text(
                          'New Message',
                          style:  TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(top: 15),
            margin: const EdgeInsets.only(right: 15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.grey.shade100
                    )
                ),
              ),
            ),
          ),
        ],
      ),
    );


    List<Widget> myWidgets = [header];

    for(int i = 1; i <= 3; i++){
      myWidgets.add(
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Messages(intNum: i);
              }));
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Color(0xFFFFD8AA),
              ),
              padding:  const EdgeInsets.all(7),
              margin: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 10),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 30, // Image radius
                      backgroundImage: AssetImage(sourceImages[i].toString()),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              sourceNames[i].toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoSlab',
                                fontSize: 15,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                sourceQuotes[i].toString(),
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

