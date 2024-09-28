import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gallery_picker/gallery_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rabuh/widgets/buttons.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/headings.dart';
import 'package:rabuh/widgets/margins.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  double postImageUIHeight = 120;
  String link =
      "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710777938/skw8npcsotwm875kmdk4.png";

  late final TabController _postAndReelsTabController;
  @override
  void initState() {
    super.initState();
    _postAndReelsTabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _postAndReelsTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleRow(),
              profileAndFollowers(),
              height(10),
              highlights(),
              height(20),
              postAndReels()
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Text("Option 1"),
            Text("Option 1"),
            Text("Option 1"),
            Text("Option 1"),
          ],
        ),
      ),
    );
  }

  Widget titleRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Heading1("vkg_001", fontWeight: FontWeight.w700),
          Row(
            children: [
              InkWell(
                onTap: () async {
                  final picker = ImagePicker();
                  final images = await picker.pickImage(source: ImageSource.gallery);

                  print(images.toString());

                  // if (files != null) {
                  //   _handleLostFiles(files);
                  // } else {
                  //   _handleError(response.exception);
                  // }
                },
                child: Icon(
                  Icons.add_box_outlined,
                  size: 34,
                ),
              ),
              width(20),
              Icon(
                Icons.menu_outlined,
                size: 34,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget profileAndFollowers() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircularAvatar(
                link,
                avatarRadius: 45,
              ),
              stats(0, "posts"),
              stats(510, "followers"),
              stats(152, "following"),
            ],
          ),
          Heading3(
            "Vikas Kumar",
            fontWeight: FontWeight.w500,
          ),
          Heading3("Unpaired Electron", fontWeight: FontWeight.w400),
          height(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: softButton(
                  onTap: () {},
                  child: Text(
                    "Edit Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              width(7),
              Expanded(
                flex: 3,
                child: softButton(
                  onTap: () {},
                  child: Text(
                    "Share Profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              width(7),
              Expanded(
                flex: 1,
                child: softButton(
                  onTap: () {},
                  child: Icon(
                    Icons.person_add_alt_outlined,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget stats(int n, String text) {
    return Column(
      children: [
        Heading2(n.toString(), fontWeight: FontWeight.w700),
        height(4),
        Heading3(text, fontWeight: FontWeight.w400),
      ],
    );
  }

  Widget highlights() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          width(5),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(
                  23,
                ),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.add,
                  size: 35,
                ),
              ),
              Text(
                "New",
              ),
            ],
          ),
          CircularAvatar(link, showBorder: false, name: "Vizag"),
          CircularAvatar(link, showBorder: false, name: "Puri"),
          CircularAvatar(link, showBorder: false, name: "Vizag"),
          CircularAvatar(link, showBorder: false, name: "Puri"),
          CircularAvatar(link, showBorder: false, name: "Vizag"),
          CircularAvatar(link, showBorder: false, name: "Puri"),
        ],
      ),
    );
  }

  Widget postAndReels() {
    List<PostData> postData = getPostData();

    return Column(
      children: [
        TabBar(
          controller: _postAndReelsTabController,
          tabs: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.grid_on_outlined,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.perm_contact_calendar_outlined,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(
          height: (postImageUIHeight) * ((postData.length / 3) + 1),
          child: TabBarView(
            controller: _postAndReelsTabController,
            children: [
              posts(postData),
              Center(
                child: Heading1("Reels"),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget posts(List<PostData> postData) {
    Widget ans = SizedBox();
    List<Widget> rows = [];
    int i = 0;
    rows.add(height(2));
    while (i < postData.length) {
      List<Widget> rowElement = [];
      int j = i;
      while (j < postData.length  &&  j < i + 3) {
        rowElement.add(postImageUI(postData[i].image));
        if (j != i + 2) {
          rowElement.add(width(2));
        }
        j++;
      }

      rows.add(Row(children: rowElement,));
      rows.add(height(2));
      i += 3;
    }

    ans = Column(
      children: rows,
    );

    return ans;
  }

  Widget postImageUI(String? link) {
    return Expanded(
      child: SizedBox(
        height: postImageUIHeight,
        child: (link != null) ? Image(
          image: NetworkImage(link),
          fit: BoxFit.cover,
        ) : SizedBox.shrink(),
      ),
    );
  }

  List<PostData> getPostData() {
    List<PostData> ans = [];
    for (int i = 0; i < 25; i++) {
      ans.add(
        PostData(i, link),
      );
    }
    return ans;
  }
}

class PostData {
  final int id;
  final String image;
  PostData(this.id, this.image);
}
