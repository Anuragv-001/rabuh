import 'package:flutter/material.dart';
import 'package:rabuh/widgets/explore_card.dart';
import 'package:rabuh/widgets/searchBar.dart';

import '../widgets/margins.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(top: true, child: SizedBox.shrink(),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: searchBar(searchBarController),
            ),
            height(10),
            ...getExplorePosts(),
          ],
        ),
      ),
    );
  }

  List<Widget> getExplorePosts() {
    String link =
        "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710777938/skw8npcsotwm875kmdk4.png";
    String verticalImage =
        "https://res.cloudinary.com/dza7mzhl1/image/upload/c_crop,w_100,h_400/v1711976821/a6mdlvhkpqcsg4g2dghd.jpg";
    List<Widget> ans = [];

    ans.add(getFourImages(link, link, link, verticalImage));

    ans.add(getThreeImagesWide(link, link, link));

    ans.add(getThreeImagesEqual(link, verticalImage, link));

    ans.add(getTwoImagesWide(link, link));

    ans.add(getFourImages(link, link, link, verticalImage));

    ans.add(getThreeImagesWide(link, link, link));

    ans.add(getThreeImagesEqual(link, verticalImage, link));

    ans.add(getTwoImagesWide(link, link));

    return ans;
  }

  Widget getFourImages(String img1, String img2, String img3, String img4) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 300,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
                    child: ExploreCard(img1),
                  ),
                  height(5),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ExploreCard(img2),
                        ),
                        width(5),
                        Expanded(
                          flex: 1,
                          child: ExploreCard(img3),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          width(5),
          Expanded(
            flex: 1,
            child: ExploreCard(img4),
          ),
        ],
      ),
    );
  }

  Widget getThreeImagesWide(String img1, String img2, String img3) {
    return Column(
      children: [
        height(5),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 147.5,
                    child: ExploreCard(img1),
                  ),
                  height(5),
                  SizedBox(
                    height: 147.5,
                    child: ExploreCard(img2),
                  ),
                ],
              ),
            ),
            width(5),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: 300,
                child: ExploreCard(img3),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getThreeImagesEqual(String img1, String img2, String img3) {
    double mxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 100,
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Row(
        children: [
          SizedBox(
            width: (mxWidth / 3) - 3.34,
            child: ExploreCard(
              img1,
            ),
          ),
          width(5),
          SizedBox(
            width: (mxWidth / 3) - 3.34,
            child: ExploreCard(
              img2,
            ),
          ),
          width(5),
          SizedBox(
            width: (mxWidth / 3) - 3.34,
            child: ExploreCard(
              img3,
            ),
          ),
        ],
      ),
    );
  }

  Widget getTwoImagesWide(String img1, String img2) {
    return Container(
      height: 300,
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: ExploreCard(img1),
          ),
          width(5),
          Expanded(
            child: ExploreCard(
              img2,
            ),
          ),
        ],
      ),
    );
  }
}
