import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/margins.dart';

Widget messageTile(String profilePic, List<String> messages,
    bool isReceivedMessage,
    {List<String?> image = const [], Color? backgroundColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 8.0,
    ),
    child: Column(
      children: [
        ...getMessageTiles(
            profilePic, messages, isReceivedMessage, image, backgroundColor),
      ],
    ),
  );
}

List<Widget> getMessageTiles(String profilePic, List<String> messages,
    bool isReceivedMessage, List<String?> image, Color? backgroundColor) {
  List<Widget> ans = [];

  for (int i = 0; i < messages.length - 1; i++) {
    String message = messages[i];
    String? im = (image.length > i) ? image[i] : null;
    ans.add(Column(
      children: [
        Row(
          mainAxisAlignment: (isReceivedMessage)
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 58,
            ),
            messageContent(message, isReceivedMessage, im, backgroundColor),
          ],
        ),
        height(
          8,
        ),
      ],
    ));
  }

  int idx = messages.length - 1;
  String message = messages[messages.length - 1];
  String? img = (idx < image.length) ? image[idx] : null;
  ans.add(Row(
    mainAxisAlignment:
        (isReceivedMessage) ? MainAxisAlignment.start : MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      (isReceivedMessage)
          ? CircularAvatar(
              profilePic,
              showBorder: false,
              avatarRadius: 20,
            )
          : SizedBox.shrink(),
      messageContent(message, isReceivedMessage, img, backgroundColor),
    ],
  ));

  return ans;
}

Widget messageContent(String message, bool isReceivedMessage, String? image, Color? backgroundColor) {
  var rad30 = Radius.circular(30);
  return Container(
    width: 250,
    child: Column(
      children: [
        (image != null)
            ? ClipRRect(
          borderRadius: BorderRadius.circular(10),
                child: Image(
                  height: 220,
                  image: NetworkImage(
                    image,
                  ),
                  fit: BoxFit.cover,
                ),
              )
            : Align(
              alignment: (isReceivedMessage) ? AlignmentDirectional.centerStart : AlignmentDirectional.centerEnd,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  color: (image != null)
                      ? Colors.transparent
                      : (isReceivedMessage)
                      ? ((backgroundColor != null) ? backgroundColor : CupertinoColors.systemGrey5)
                      : Colors.green,
                  borderRadius: BorderRadius.only(
                    topRight: rad30,
                    topLeft: rad30,
                    bottomRight: (isReceivedMessage) ? rad30 : Radius.circular(0),
                    bottomLeft: (isReceivedMessage) ? Radius.circular(0) : rad30,
                  ),
                ),
                child: Text(
                    message,
                  style: TextStyle(
                    color: (isReceivedMessage) ? Colors.black : Colors.white,
                  ),
                  ),
              ),
            ),
      ],
    ),
  );
}

Widget timeStampTile(String stamp, {bool seenStamp = false}) {
  return Padding(
    padding: (seenStamp)
        ? EdgeInsets.only(bottom: 10.0)
        : EdgeInsets.symmetric(vertical: 15.0),
    child: SizedBox(
      width: double.maxFinite,
      child: Text(
        stamp,
        textAlign: (seenStamp) ? TextAlign.end : TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    ),
  );
}
