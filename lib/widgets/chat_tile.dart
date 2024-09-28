import 'package:flutter/material.dart';
import 'package:rabuh/themes/theme.dart';
import 'package:rabuh/widgets/circularAvatar.dart';
import 'package:rabuh/widgets/margins.dart';

Widget chatTile(String image, String name, String description, IconData icon, {bool showVerifiedIcon = false, String secondaryDescription = "", void Function()? onTap}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10,),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            CircularAvatar(image, showBorder: showVerifiedIcon, avatarRadius: 30,),
            width(10),
            InkWell(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      width(6),
                      (showVerifiedIcon) ? Icon(
                        Icons.check_circle_rounded,
                        size: 16,
                        color: AppTheme.lightTheme.colorScheme.primary,
                      ) : SizedBox.shrink(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        description,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      ...(secondaryDescription.isNotEmpty) ? [
                        width(5),
                        Icon(
                          Icons.circle,
                          size: 4,
                          color: Colors.grey,
                        ),
                        width(5),
                        Text(
                          secondaryDescription,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ] : [],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 7,),
          child: Icon(
            Icons.photo_camera_outlined,
            size: 28,
          ),
        ),
      ],
    ),
  );
}