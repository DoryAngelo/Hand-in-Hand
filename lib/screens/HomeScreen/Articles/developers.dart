import 'package:flutter/material.dart';
import 'Info/devinfo.dart';
import '../../AccountScreen/profile_page.dart';
import  '../Messages/messages_cat.dart';
import '../Notifications/notification_cat.dart';
import '../homepage.dart';

class Developers extends StatefulWidget {
  @override
  _DeveloperState createState() => _DeveloperState();
}


class _DeveloperState extends State<Developers> {

  @override
  Widget build(BuildContext context) {

    Widget header = Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 20),
            alignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 16/8,
              child: Image.asset(
                'assets/images/developers.jpeg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top:135, left: 15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Developers' Page",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'RobotoSlab',
                  fontSize: 37.0,
                ),
              )),
        ],
      ),
    );

    List<Widget> myWidgets = [header];

    for(int i = 1; i <= 3; i++){
      myWidgets.add(
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Color(0xFFFFD8AA),
          ),
          padding:  const EdgeInsets.all(20),
          margin: const EdgeInsets.only(left: 15, right: 15, top: 0, bottom: 20),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(65),
                  child: Image(
                    image: AssetImage(sourceImages[i].toString()),
                    fit: BoxFit.cover,
                  ),
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
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, left: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.phone,
                              color: Colors.red[500],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                sourceNumbers[i].toString(),
                                style: const TextStyle(
                                  color: Color(0xFF8B4513),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8, left: 8),
                        child: Row(
                          children: [
                            Icon(
                              Icons.email,
                              color: Colors.red[500],
                            ),
                            Container(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                sourceEmails[i].toString(),
                                style: const TextStyle(
                                  color: Color(0xFF8B4513),
                                  fontFamily: 'Roboto',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
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
        children:
        myWidgets,
      ),

    );
  }
}