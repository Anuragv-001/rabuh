import 'package:flutter/material.dart';
import 'package:rabuh/themes/theme.dart';
import 'package:rabuh/widgets/headings.dart';

import '../widgets/notification_tile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

String link =
    "https://res.cloudinary.com/dza7mzhl1/image/upload/v1710777938/skw8npcsotwm875kmdk4.png";

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationTile> notifications = [
    NotificationTile(
      link,
      " mentioned you in a comment: ",
      "3d",
      secondaryDescription: "@vkg_001 bro do something",
      secondaryImage: link,
      title: "poetic.engineering",
    ),
    NotificationTile(
        "https://icon-library.com/images/windows-settings-icon/windows-settings-icon-29.jpg",
        "Review who can mention you so your account works the way you want.",
        "3d"),
    NotificationTile(link, ", who you might know, is on Rabuh.", "4d",
        showActionButton: true, actionButtonText: "Follow", onTap: () {
      print("Followed");
    },
        title: "tinkusharma2477",
        actionButtonColor: Colors.green,
        actionButtonTextColor: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading2(
          "Notification",
        ),
        iconTheme: AppTheme.lightTheme.iconTheme,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...getNotifications(),
          ],
        ),
      ),
    );
  }

  List<Widget> getNotifications() {
    List<Widget> ans = [];
    for (int i = 0; i < 10; i++) {
      for (var notif in notifications) {
        ans.add(notif.getNotificationUI());
      }
    }

    return ans;
  }
}
