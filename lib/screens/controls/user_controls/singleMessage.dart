// ignore_for_file: file_names, use_key_in_widget_constructors
import 'package:vonette_web/constants.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:vonette_schools/shared/constants.dart';

class SingleMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  final dynamic time;
  const SingleMessage({required this.isMe, required this.message, this.time});

  @override
  Widget build(BuildContext context) {
    // var updatedTime = DateFormat('h:mm a')
    //     .format(DateTime(2022, 1, 1, time.toDate().hour, time.toDate().minute));
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          isMe
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(time, style: const TextStyle(fontSize: 10)),
                )
              : Container(),
          Bubble(
            margin: BubbleEdges.only(top: 10),
            padding: BubbleEdges.all(12),
            radius: Radius.circular(12),
            alignment: isMe ? Alignment.topRight : Alignment.topLeft,
            nip: isMe ? BubbleNip.rightTop : BubbleNip.leftTop,
            color: isMe ? Colors.blueGrey[200] : Colors.white,
            child: Container(
              constraints: BoxConstraints(maxWidth: 200),
              child: Text(
                message,
                textAlign: isMe ? TextAlign.right : TextAlign.left,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          !isMe
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 3.0),
                  child: Text(time, style: const TextStyle(fontSize: 10)),
                )
              : Container(),
        ],
      ),
    );
  }
}
