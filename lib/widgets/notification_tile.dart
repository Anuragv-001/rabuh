import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/margins.dart';

class NotificationTile {
  String primaryImage, description, timestamp;
  String? secondaryImage, title, actionButtonText, secondaryDescription;
  bool showActionButton;
  double primaryImageRadius;
  void Function()? onTap;
  Color actionButtonColor, actionButtonTextColor;

  NotificationTile(
    this.primaryImage,
    this.description,
    this.timestamp, {
    this.title,
    this.actionButtonText,
    this.secondaryImage,
    this.showActionButton = false,
    this.onTap,
    this.secondaryDescription,
    this.primaryImageRadius = 30,
    this.actionButtonColor = Colors.green,
    this.actionButtonTextColor = Colors.white,
  });

  Widget getNotificationUI() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                CircularAvatar(
                  primaryImage,
                  showBorder: false,
                  avatarRadius: primaryImageRadius,
                  avatarBackgroundColor: Colors.transparent,
                ),
                width(2),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: CupertinoColors.black),
                      children: [
                        TextSpan(
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          text: (title != null) ? title : "",
                        ),
                        TextSpan(
                          text: description,
                        ),
                        TextSpan(
                          text: (secondaryDescription != null)
                              ? secondaryDescription
                              : "",
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                          text: " $timestamp",
                        ),
                      ],
                    ),
                  ),
                ),
                width(5),
              ],
            ),
          ),
          (secondaryImage != null)
              ? Image(
                  image: NetworkImage(
                    secondaryImage!,
                  ),
                  width: 50,
                )
              : const SizedBox.shrink(),
          (showActionButton)
              ? InkWell(
                  onTap: onTap,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20,),
                    decoration: BoxDecoration(
                      color: actionButtonColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      actionButtonText!,
                      style: TextStyle(
                        color: actionButtonTextColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
