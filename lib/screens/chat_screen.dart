import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/headings.dart';
import 'package:rabuh/widgets/margins.dart';
import 'package:rabuh/widgets/message_tile.dart';

class ChatScreen extends StatefulWidget {
  final int profileId;
  final String profilePic, name, lastSeen;
  final bool showStoryBorder;
  const ChatScreen(this.profileId, this.name, this.profilePic, this.lastSeen, this.showStoryBorder, {super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  TextEditingController messageController = TextEditingController();
  List<Widget> messageTiles = [];
  Widget seenStamp = timeStampTile("Seen 5 min ago", seenStamp: true);
  ScrollController scrollController = ScrollController(initialScrollOffset: 500000);

  bool isChatLoaded = false;


  @override
  void initState() {
    super.initState();
    loadMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircularAvatar(widget.profilePic, showBorder: widget.showStoryBorder, avatarRadius: 20,),
                width(4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Heading3(widget.name,),
                    MutedText(widget.lastSeen,),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.phone_outlined,
                ),
                width(10),
                Icon(
                  Icons.videocam_outlined,
                  size: 30,
                ),
                width(10),
              ],
            ),
          ],
        ),
        elevation: 1,
        titleSpacing: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 8.0, left: 8, right: 8),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            // border: Border.all(),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                messageBlock(),
                messageBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget messageBlock() {

    return SizedBox(
      height: 606,
      child: (isChatLoaded) ? ListView(
        controller: scrollController,
        children: [
          ...messageTiles,
          seenStamp,
        ],
      ) : SpinKitCircle(
        color: Colors.green,
      ),
    );
  }

  Widget messageBox() {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey5,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green
                    ),
                    child: Icon(
                      Icons.camera_alt_outlined,
                          color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: TextField(
              controller: messageController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Message...",
              ),
              onSubmitted: (message) {
                if (message.isNotEmpty) {
                  sendMessage(message);
                  messageController.text = "";
                }
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.mic_none,
                ),
                Icon(
                  Icons.image_outlined,
                ),
                Icon(
                  Icons.emoji_emotions_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void loadMessages() {

    List<String> messages = [
      "Message will be shown here....",
      "Message will be shown here https://res.cloudinary.com/dza7mzhl1/image/upload/v1710351957/iqdmhyynkzyuqwxbelyy.jpg https://res.cloudinary.com/dza7mzhl1/image/upload/v1710351957/iqdmhyynkzyuqwxbelyy.jpg....",
      "hello",
    ];

    List<String?> image = [null, "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710351957/iqdmhyynkzyuqwxbelyy.jpg"];

    Timer.periodic(Duration(seconds: 3), (timer) {
      timer.cancel();
      setState(() {
        messageTiles = [
          messageTile(widget.profilePic, messages, true, image: image,),
          timeStampTile("Yesterday 10:39 AM",),
          messageTile(widget.profilePic, messages, false),
          messageTile(widget.profilePic, messages, true),
          timeStampTile("Yesterday 10:39 AM",),
          messageTile(widget.profilePic, messages, false),
          messageTile(widget.profilePic, messages, true),
          messageTile(widget.profilePic, messages, false),
          timeStampTile("Yesterday 10:39 AM",),
          messageTile(widget.profilePic, messages, true, image: image),
          messageTile(widget.profilePic, messages, false, image: image),
        ];
        isChatLoaded = true;
      });
    });
  }

  void sendMessage(String message) {
    List<String> messages = [message];

    setState(() {
      seenStamp = SizedBox.shrink();
      messageTiles.add(messageTile(widget.profilePic, messages, false));
    });
    scrollChat();

    Timer.periodic(Duration(seconds: 3), (timer) {
      timer.cancel();
      setState(() {
        messageTiles.add(messageTile(widget.profilePic, messages, true));
      });
      scrollChat();
    });
  }

  void scrollChat() {
    scrollController.animateTo(scrollController.position.maxScrollExtent + 200, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}