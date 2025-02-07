import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'data.dart';



class Messages extends StatefulWidget {
  const Messages({Key? key, required this.intNum}) : super(key: key);

  final int intNum;
  @override
  _MessagesState createState() => _MessagesState();
}


class _MessagesState extends State<Messages> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffF58216),
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: 52),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 23, // Image radius
                    backgroundImage: AssetImage(sourceImages[widget.intNum].toString()),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            sourceNames[widget.intNum].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'RobotoSlab',
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 0.5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left:1),
                            child: Text(
                              sourceQuotes[widget.intNum].toString(),
                              style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.settings,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.only(left: 20, bottom: 15, right: 20),
                reverse: true,
                order: GroupedListOrder.DESC,
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => Container(
                  margin: EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 40,
                    child: Container(
                      child: Center(
                        child: Card(
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              DateFormat.yMMMd().format(message.date),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: message.isSentByMe
                        ? Color(0xFFFFD8AA)
                          : Colors.grey.shade200,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Text(message.text),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: myController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          hintText: 'Type your message here...',
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          final message = Message(
                            text: myController.text,
                            date: DateTime.now(),
                            isSentByMe: true,
                          );

                          if (myController.text.isNotEmpty) {
                            setState(() {
                              messages.add(message);
                              myController.clear();
                            });
                          }
                        },
                        icon: Icon(Icons.send, color: Colors.blue,),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
