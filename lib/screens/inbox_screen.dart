import 'package:flutter/material.dart';
import 'package:rabuh/screens/inbox_screen_body.dart';
import 'package:rabuh/widgets/headings.dart';
import 'package:rabuh/widgets/margins.dart';

class InboxScreen extends StatefulWidget {
  final TabController _tabController;
  const InboxScreen(this._tabController, {super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget._tabController.animateTo(1, duration: const Duration(seconds: 1));
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      widget._tabController.animateTo(1, duration: Duration(milliseconds: 700,),);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  width(15),
                  Heading2("vkg_001"),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.videocam_outlined,
                    color: Colors.black,
                    size: 28,
                  ),
                  width(10),
                  Icon(
                    Icons.edit_note_sharp,
                    color: Colors.black,
                    size: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: InboxScreenBody(),
      ),
    );
  }
}