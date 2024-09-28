import 'package:flutter/material.dart';

class CircularAvatar extends StatelessWidget {
  final String image, name;
  final bool isNetworkImage, showBorder;
  final double avatarRadius;
  Color avatarBackgroundColor;
  CircularAvatar(this.image,
      {super.key,
      this.isNetworkImage = true,
      this.showBorder = true,
      this.name = "",
      this.avatarRadius = 40, this.avatarBackgroundColor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: (2 * avatarRadius) + 8,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                border: Border.all(
                    color: Colors.green, width: (showBorder) ? 3 : 0),
              ),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                        color: Colors.white, width: (showBorder) ? 1 : 0),
                  ),
                child: (isNetworkImage)
                    ? CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: NetworkImage(image),
                  backgroundColor: avatarBackgroundColor,
                )
                    : CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: AssetImage(image),
                  backgroundColor: avatarBackgroundColor,
                ),
              ),
            ),
            (name.isNotEmpty)
                ? SizedBox(
                    height: 16,
                    child: Text(
                      (name.length > 7) ? ("${name.substring(0, 6)}...") : name,
                    ),
                  )
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
