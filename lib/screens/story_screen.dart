import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabuh/screens/story_detail_screen.dart';
import 'package:rabuh/themes/theme.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/lines.dart';
import 'package:rabuh/widgets/margins.dart';

class StoryScreen extends StatefulWidget {
  final TabController _tabController;
  const StoryScreen(this._tabController, {super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                addStoryAvatar(),
                ...getStories(),
              ],
            ),
          ),
          height(15),
          line(0.2),
        ],
      ),
    );
  }

  List<Widget> getStories() {
    List<String> stories = [
      "https://res.cloudinary.com/dza7mzhl1/image/upload/v1711468017/qhnimwgs4rq1j67g3zmw.png",
      "https://res.cloudinary.com/dza7mzhl1/image/upload/v1711459892/rxc8vazmkt0695enuexs.png",
      "https://res.cloudinary.com/dza7mzhl1/image/upload/v1711459802/tbuvkgrpsukqr7oxocxp.png",
    ];

    List<Widget> ans = [];
    for (int i = 0; i < 4 * stories.length; i++) {
      ans.add(
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => StoryDetailScreen(i)));
          },
          child: Hero(
            tag: "user-id-$i",
            child: CircularAvatar(
              stories[i % (stories.length)],
              name: "Name Here",
              avatarRadius: 30,
            ),
          ),
        ),
      );
    }

    return ans;
  }

  Widget addStoryAvatar() {
    double avatarRadius = 32.5;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: InkWell(
        onTap: () {
          widget._tabController.animateTo(0);
        },
        child: SizedBox(
          width: (2 * avatarRadius) + 4,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: NetworkImage(
                    "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710777938/skw8npcsotwm875kmdk4.png",
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.lightTheme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: AppTheme.lightTheme.colorScheme.onPrimaryContainer,
                    weight: 600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
