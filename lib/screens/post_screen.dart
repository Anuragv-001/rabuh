import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabuh/widgets/post_card.dart';


class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...loadPosts(),
      ],
    );
  }

  List<Widget> loadPosts() {
    List<Widget> ans = [];
    for (int i = 0; i < 5; i++) {
      ans.add(PostCard());
    }
    return ans;
  }
}
