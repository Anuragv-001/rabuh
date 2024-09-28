import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rabuh/themes/theme.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/headings.dart';
import 'package:rabuh/widgets/lines.dart';
import 'package:rabuh/widgets/margins.dart';
import 'package:rabuh/widgets/searchBar.dart';

class StoryDetailScreen extends StatefulWidget {
  final int userId;
  const StoryDetailScreen(this.userId, {super.key});

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  TextEditingController sendMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double bottomContentHeight = 70;
    double mHeight = MediaQuery.of(context).size.height;
    double mWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: mHeight,
          width: mWidth,
          child: Column(
            children: [
              SizedBox(
                height: mHeight - bottomContentHeight,
                child: mainContent(),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  width(5),
                  SizedBox(
                    height: bottomContentHeight,
                    width: mWidth - 100,
                    child: searchBar(sendMessageController, hintText: "Send Message", prefixIcon: null),
                  ),
                  width(5),
                  Icon(
                    Icons.favorite_border_outlined,
                    size: 40,
                  ),
                  width(5),
                  Icon(
                    FontAwesomeIcons.paperPlane,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainContent() {
    String link =
        "https://res.cloudinary.com/dza7mzhl1/image/upload/v1711468017/qhnimwgs4rq1j67g3zmw.png";
    String name = "vkg_001";
    String song = "song.mp3";
    String storyImg =
        "https://res.cloudinary.com/dza7mzhl1/image/upload/v1711459892/rxc8vazmkt0695enuexs.png";
    double length = (MediaQuery.of(context).size.width * 40) / 100;
    double lineWidth = 1;

    return Stack(
      children: [
        Center(
          child: Image(
            fit: BoxFit.cover,
            image: NetworkImage(storyImg),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top + 4,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Stack(
                    children: [
                      line(lineWidth,
                          color: AppTheme.lightTheme.colorScheme.primary),
                      lineWithLength(lineWidth, length,
                          color:
                              AppTheme.lightTheme.colorScheme.inversePrimary),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Hero(
                            tag: "user-id-${widget.userId}",
                            child: CircularAvatar(
                              link,
                              showBorder: false,
                              avatarRadius: 20,
                            ),
                          ),
                          width(
                            10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Heading3(
                                    name,
                                  ),
                                  width(4),
                                  Icon(
                                    Icons.circle,
                                    size: 4,
                                    color: Colors.grey,
                                  ),
                                  width(4),
                                  MutedText("8h", weight: FontWeight.w400),
                                ],
                              ),
                              MutedText(
                                song,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.more_vert,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
