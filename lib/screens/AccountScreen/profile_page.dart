import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'widgets/profile_widget.dart';
import 'utils/user_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class CardItem {
  final String urlImage;
  final String title;

  const CardItem({
    required this.urlImage,
    required this.title,
  });
}

class _ProfilePageState extends State<ProfilePage> {
  List<CardItem> items = [
    CardItem(
        urlImage:
            'https://ap.fftc.org.tw/sites/default/files/styles/project_slider/public/asian-farmer-working-field-spraying-chemical.jpg?itok=3OQJQjVt',
        title: 'Fund Raiser for Farmers'),
    CardItem(
        urlImage:
            'https://www.cnnphilippines.com/dam/jcr:4417140c-5204-4153-89f4-af589180362e/Photo-21.jpg',
        title: 'Community Aid Pantry'),
    CardItem(
        urlImage:
            'https://www.sif.org.sg/-/media/Project/Singapore-International-Foundation/Corporate-Site/SIF30-wideanglev2bForWebsite/WWD2022-BeachCleanUp--2.jpg',
        title: 'Beach Clean Up'),
  ];
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.getUser();

    return Scaffold(
      backgroundColor: Color(0xFFFFD8AA),
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: const Color(0xffF58216),
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoSlab',
            color: Colors.white,
            fontSize: 25
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: Column(
              children: [
                // Profile Picture
                ProfileWidget(
                  imagePath: user.imagePath,
                  onClicked: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => EditProfilePage()),
                    );
                    setState(() {});
                  },
                ),

                SizedBox(
                  height: 6,
                ),

                // Profile name and email
                Text(
                  user.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  user.email,
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),

                // Profile Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildMaterialButton(context, '4.8', 'Ranking'),
                    buildMaterialButton(context, '35', 'Following'),
                    buildMaterialButton(context, '50', 'Followers'),
                  ],
                ),

                // About
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoSlab',
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        user.about,
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 24,
                ),

                // Volunteer Work
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: Text(
                        'Voluteer Work',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoSlab',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35, bottom: 20),
                      height: 160,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: items.length,
                        separatorBuilder: (context, _) => SizedBox(
                          width: 6,
                        ),
                        itemBuilder: (context, index) =>
                            buildCard(item: items[index]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard({required CardItem item}) => Container(
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    item.urlImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Text(
              item.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      );

  MaterialButton buildMaterialButton(
      BuildContext context, String value, String text) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 18),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            value,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
