import 'package:flutter/material.dart';
import 'package:rabuh/screens/chat_screen.dart';
import 'package:rabuh/widgets/chat_tile.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/headings.dart';
import 'package:rabuh/widgets/searchBar.dart';

class InboxScreenBody extends StatefulWidget {
  const InboxScreenBody({super.key});

  @override
  State<InboxScreenBody> createState() => _InboxScreenBodyState();
}

class _InboxScreenBodyState extends State<InboxScreenBody> {

  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...searchAndOnline(),
            chatBody(),
          ],
        ),
      ),
    );
  }


  List<Widget> searchAndOnline() {
    List<Widget> ans = [];

    ans.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: searchBar(searchBarController),
      ),
    );

    List<Widget> stories = [];
    for (int i = 0; i < 10; i++) {
      stories.add(CircularAvatar("https://res.cloudinary.com/dza7mzhl1/image/upload/v1711635891/alypscc6t3bqwbvkcxx6.jpg", name: "Name Here", showBorder: i % 3 == 0,),);
    }

    ans.add(
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...stories,
          ],
        ),
      )
    );

    return ans;
  }

  Widget chatBody() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 25, bottom: 10,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Heading3("Messages",),
              Heading3("Requests", textColor: Colors.lightBlue),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              ...getChatTiles(),
            ],
          ),
        ),
      ],
    );
  }


  List<Widget> getChatTiles() {
    List<Widget> ans = [];

    String lastSeen = "Active 14m ago", name = "Vikas Kumar", profilePic = "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710351957/iqdmhyynkzyuqwxbelyy.jpg";

    for (int i = 0; i < 15; i++) {
      bool showStoryBorder = i % 4 == 0;
      ans.add(chatTile(profilePic, name, (i % 3 == 0) ? "Active now" : "Liked a message", Icons.camera_alt_outlined, showVerifiedIcon: showStoryBorder, secondaryDescription: (i % 3 != 0) ? "1d" : "", onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(1, name, profilePic, lastSeen, showStoryBorder)));
      }));
    }
    return ans;
  }
  

}