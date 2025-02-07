import 'dart:convert';

import '../model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static const _keyUser = 'user';

  static const myUser = User(
    imagePath:
        'https://6.soompi.io/wp-content/uploads/image/9b38bd08d1454166ae5b0b721eb6d22d.jpeg?s=900x600&e=t',
    name: 'Do Kyungsoo',
    email: 'kyungsoo@exo.com',
    about:
        'Doh Kyung-soo, also professionally known as D.O., is a South Korean singer and actor, best known as a member of the South Korean-Chinese boy group Exo.',
  );

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setUser(User user) async {
    final json = jsonEncode(user.toJson());

    await _preferences.setString(_keyUser, json);
  }

  static User getUser() {
    final json = _preferences.getString(_keyUser);
    return json == null ? myUser : User.fromJson(jsonDecode(json));
  }
}
