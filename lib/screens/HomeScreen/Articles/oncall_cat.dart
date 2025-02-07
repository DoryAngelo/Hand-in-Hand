import 'package:flutter/material.dart';
import '../../AccountScreen/profile_page.dart';
import  '../Messages/messages_cat.dart';
import '../Notifications/notification_cat.dart';
import '../homepage.dart';

class OnCallCategory extends StatelessWidget {
  const OnCallCategory({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;

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
        body: Stack(
          children: <Widget>[
            gradientBg,
            Column(
              children: <Widget>[header, camera(screenHeight)],
            ),
          ],
        ),
      ),
    );
  }
}

  Widget gradientBg = Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xffCC3434), Color(0xffFFF4E8)],
      ),
    ),
  );

  Widget header = const Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image(
          width: 60,
          height: 60,
          image: AssetImage('assets/images/oncall_icon.png'),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Be On-Call',
                style: TextStyle(
                  fontFamily: 'RobotoSlab',
                  fontSize: 40,
                  height: 1,
                  color: Color(0xffFFF4E8),
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                    ' Nunc nec lectus id augue viverra sodales nec eget odio.'
                    ' Nam hendrerit tellus et enim condimentum, ac ultrices felis ullamcorper.'
                    ' In vitae convallis leo, ac accumsan neque.',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 12,
                  height: 1.3,
                  color: Color(0xffFFF4E8),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );

  Widget camera(double screenHeight) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(left:20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xffCC3434),
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Color(0xffCC3434),
        ),
        height: screenHeight, // Adjust the height as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffFFF4E8),
                  ),
                  color: Color(0xffFFF4E8),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                width: 120,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                          width: 50,
                          height: 50,
                          image: AssetImage('assets/images/oncall_operator.png')),
                      SizedBox(height: 5),
                      Text(
                        'Be an operator.',
                        style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 23,
                            height: 0.8,
                            color: Color(0xffCC3434)),
                      ),
                    ],
                  ),
                )),
            SizedBox(width: 15),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xffFFF4E8),
                  ),
                  color: Color(0xffFFF4E8),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                width: 120,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image(
                          width: 50,
                          height: 50,
                          image: AssetImage('assets/images/oncall_caller.png')),
                      SizedBox(height: 5),
                      Text(
                        'Call an operator.',
                        style: TextStyle(
                            fontFamily: 'RobotoSlab',
                            fontSize: 23,
                            height: 0.8,
                            color: Color(0xffCC3434)),
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



