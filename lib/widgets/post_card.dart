import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/lines.dart';

import 'headings.dart';
import 'margins.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  String profile =
      "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710775815/hoxfnleimjobyormofih.png";
  bool isLiked = false;
  double iconOpacity = 0;
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircularAvatar(
                    "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710777938/skw8npcsotwm875kmdk4.png",
                    showBorder: false,
                    avatarRadius: 25,
                  ),
                  width(5),
                  Heading3("Name Here"),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.more_vert,
                  )
                ],
              )
            ],
          ),
          height(5),
          InkWell(
            onDoubleTap: () {
              setState(() {
                isLiked = !isLiked;
                if (isLiked) {
                  iconOpacity = 1;
                }
              });

              Timer.periodic(Duration(milliseconds: 400), (timer) {
                setState(() {
                  iconOpacity = 0;
                });
                timer.cancel();
              });
            },
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(
                    "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710777913/od8gubqdbwihcdohw7gd.jpg",
                  ),
                  height: 300,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: SizedBox(
                    height: 300,
                    child: Align(
                      alignment: Alignment.center,
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0),
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 100,
                          color: Colors.red.withOpacity(iconOpacity),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          height(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  width(10),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: (isLiked)
                        ? Icon(
                            Icons.favorite,
                            size: 30,
                            color: Colors.red,
                          )
                        : Icon(
                            Icons.favorite_border_outlined,
                            size: 30,
                          ),
                  ),
                  width(10),
                  Icon(
                    FontAwesomeIcons.comment,
                    size: 27,
                  ),
                  width(10),
                  Icon(
                    FontAwesomeIcons.paperPlane,
                    size: 25,
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark_border_outlined,
                    size: 30,
                  )
                ],
              ),
            ],
          ),
          height(10),
          Row(
            children: [
              SizedBox(
                width: 60,
                child: Stack(
                  children: [
                    CircularAvatar(
                      "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710777910/p1sr2ylzqwwvabxnmoni.jpg",
                      avatarRadius: 15,
                      showBorder: false,
                    ),
                    Positioned(
                      left: 15,
                      child: CircularAvatar(
                        "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710775574/tmcs74yzduwugthhxscv.webp",
                        avatarRadius: 15,
                        showBorder: false,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Liked by ",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Heading4("vkg_001 "),
              Text(
                "and ",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Heading4("582 others"),
            ],
          ),
          height(10),
          Row(
            children: [
              width(10),
              Heading4("Name Here"),
              width(5),
              Text(
                "Caption here",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              MutedText(" ...more", fontSize: 13),
            ],
          ),
          height(10),
          commentSection(),
          height(10),
          Row(
            children: [
              CircularAvatar(
                "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710775815/hoxfnleimjobyormofih.png",
                avatarRadius: 17,
                showBorder: false,
              ),
              width(8),
              MutedText(
                "Add a comment...",
                fontSize: 15,
                weight: FontWeight.w400,
              ),
            ],
          ),
          height(3),
          Row(
            children: [
              width(10),
              MutedText(
                "28 minutes ago",
                weight: FontWeight.w400,
              ),
            ],
          ),
          height(35),
        ],
      ),
    );
  }

  Widget commentSection() {
    return Row(
      children: [
        width(10),
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraint) {
                      return comments(constraint);
                    }),
                enableDrag: true,
                showDragHandle: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ));
          },
          child: MutedText(
            "View Comments (36 Comments)",
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget comments(BoxConstraints constraint) {
    return Column(
      children: [
        Text(
          "Comments",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        height(10),
        line(0.2),
        SizedBox(
          height: constraint.maxHeight - 30,
          child: SingleChildScrollView(
            child: Column(
              children: [
                commentTile("vkg001", "Comment here", profile, 45),
                commentTile("vkg001", "Comment here", profile, 45),
                commentTile("vkg001", "Comment here", profile, 45),
                commentTile("vkg001", "Comment here", profile, 45),
                commentTile("vkg001", "Comment here", profile, 45),
                commentTile("vkg001", "Comment here", profile, 45),
                commentTile("vkg001", "Comment here", profile, 45),
                commentTile("vkg001", "Comment here", profile, 45),
              ],
            ),
          ),
        ),
      ],
    );
    ;
  }

  Widget commentTile(String name, String comment, String profile, int likes) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircularAvatar(
                profile,
                avatarRadius: 20,
              ),
              width(13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Heading4(name, fontWeight: FontWeight.w600),
                      width(7),
                      Icon(
                        Icons.circle,
                        size: 4,
                        color: Colors.grey,
                      ),
                      width(7),
                      MutedText("6h", fontSize: 12, weight: FontWeight.w400),
                    ],
                  ),
                  height(5),
                  MutedText(
                    comment,
                    weight: FontWeight.w400,
                  ),
                  height(3),
                  Heading4(
                    "Reply",
                    fontWeight: FontWeight.w600,
                    color: CupertinoColors.systemGrey,
                  ),
                  height(5),
                  Row(
                    children: [
                      width(5),
                      Heading4(
                        "View 1 more reply",
                        color: CupertinoColors.systemGrey,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.favorite_border_outlined,
                size: 15,
              ),
              Heading4(
                likes.toString(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
