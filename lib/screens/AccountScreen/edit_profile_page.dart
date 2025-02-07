import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'widgets/profile_widget.dart';
import 'widgets/textfield_widget.dart';
import 'utils/user_preferences.dart';
import 'package:path/path.dart';

import 'model/user.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.getUser();
  late final TextEditingController name;
  late final TextEditingController email;
  late final TextEditingController about;

  @override
  void initState() {
    super.initState();
    name = TextEditingController(text: user.name);
    email = TextEditingController(text: user.email);
    about = TextEditingController(text: user.about);
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    about.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFD8AA),
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.orange,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoSlab',
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        physics: BouncingScrollPhysics(),
        children: [
          Center(
            child: Column(
              children: [
                // Profile Picture
                ProfileWidget(
                  imagePath: user.imagePath,
                  isEdit: true,
                  onClicked: () async {
                    final image = await ImagePicker()
                        .getImage(source: ImageSource.gallery);

                    if (image == null) return;

                    final directory = await getApplicationDocumentsDirectory();
                    final name = basename(image.path);
                    final imageFile = File('${directory.path}/$name');
                    final newImage =
                        await File(image.path).copy(imageFile.path);

                    setState(() => user = user.copy(imagePath: newImage.path));
                  },
                ),

                SizedBox(
                  height: 20,
                ),

                TextFieldWidget(
                  label: 'Full Name',
                  text: user.name,
                  onChanged: (name) => user = user.copy(name: name),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  label: 'Email',
                  text: user.email,
                  onChanged: (email) => user = user.copy(email: email),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                  label: 'About',
                  text: user.about,
                  maxLines: 4,
                  onChanged: (about) => user = user.copy(about: about),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    UserPreferences.setUser(user);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    backgroundColor: Color(0xFF8B4513),
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
