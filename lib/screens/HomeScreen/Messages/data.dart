import 'package:flutter/material.dart';


final Map<int, String> sourceNames = {
  1: 'Darrie Angelo N. De Mesa',
  2: 'Raene Elisha D. Quingquing',
  3: 'Christine H. Robles',
};

final Map<int, String> sourceFirstNames = {
  1: 'Darrie',
  2: 'Raene',
  3: 'Christine',
};

final Map<int, String> sourceImages = {
  1: 'assets/images/darrie.jpg',
  2: 'assets/images/raene.png',
  3: 'assets/images/christine.jpg',
};

final Map<int, String> sourceQuotes = {
  1: 'Know your worth.',
  2: 'Live, laugh, love.',
  3: 'Any way the wind blows.',
};

final Map<int, String> sourceTime = {
  1: '16:00',
  2: '18:00',
  3: '20:00',
};

final Map<int, IconData> sourceIcons = {
  1: Icons.notifications,
  2: Icons.handshake,
  3: Icons.message,
};

final Map<int, String> sourceNotifs = {
  1: "Be up-to-date with Darrie's latest posts \nfrom the start of November to now.",
  2: "Charity: Tree Planting.",
  3: "\"Is the specified time available?\"",
};

final Map<int, String> sourceActions = {
  1: "'s new post notifications",
  2: ' and 100 others donated',
  3: ' messaged you',
};

class Message {
  String text = "";
  DateTime date = DateTime.now().subtract(Duration(minutes: 1));
  bool isSentByMe = false;

  Message({
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}

List<Message> messages = [
  Message(
    text: "Aww, you too!",
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: true,
  ),
  Message(
    text: "May God bless you always for your generosity!",
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  Message(
    text: "See you soon!",
    date: DateTime.now().subtract(Duration(minutes: 1)),
    isSentByMe: false,
  ),
  Message(
    text: "Only doing what I can!",
    date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
    isSentByMe: true,
  ),
  Message(
    text: "You are very welcome!",
    date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
    isSentByMe: true,
  ),
  Message(
    text: "Thank you so much for your help!",
    date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
    isSentByMe: false,
  ),
  Message(
    text: "Alright, then I'll help soon.",
    date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
    isSentByMe: true,
  ),
  Message(
    text: "Yes, it is! And, the following time too!",
    date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
    isSentByMe: false,
  ),
  Message(
    text: "Hmm, let me check for a bit.",
    date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
    isSentByMe: false,
  ),
  Message(
    text: "Is the specified time available?",
    date: DateTime.now().subtract(Duration(days: 1, minutes: 1)),
    isSentByMe: true,
  ),
].reversed.toList();