import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_converter/flutter_image_converter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:rabuh/widgets/headings.dart';
import 'package:rabuh/widgets/margins.dart';

class SelectImageAndCaptionScreen extends StatefulWidget {
  final String filePath;
  final bool isImage;
  const SelectImageAndCaptionScreen(this.filePath,
      {this.isImage = true, super.key});

  @override
  State<SelectImageAndCaptionScreen> createState() =>
      _SelectImageAndCaptionScreenState();
}

class _SelectImageAndCaptionScreenState
    extends State<SelectImageAndCaptionScreen> {
  late String filePath;
  late File mediaFile;
  bool isMediaLoading = false;

  @override
  void initState() {
    super.initState();
    filePath = widget.filePath;
    mediaFile = File(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: (isMediaLoading) ? loadingUI() : bodyContent(),
        ),
      ),
    );
  }

  Widget loadingUI() {
    return SpinKitCircle(
      size: 60,
      color: Colors.green,
    );
  }

  Widget bodyContent() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Stack(
          children: [
            Image.file(
              mediaFile,
              fit: BoxFit.cover,
            ),
            bottomActions(),
            topActions(),
          ],
        ),
      ),
    );
  }

  Widget bottomActions() {
    return Positioned(
      bottom: 5,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                print("Storied",);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30,),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  children: [
                    Heading3(
                      "Story",
                    ),
                    width(5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                print("Posted",);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30,),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  children: [
                    Heading3(
                      "Post",
                    ),
                    width(5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topActions() {
    return Positioned(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              print("Discard",);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15,),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Icon(
                FontAwesomeIcons.times,
              ),
            ),
          ),
          InkWell(
            onTap: () async {

              final uIntImage = await mediaFile.uint8List;

              final editedImage = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageEditor(
                    image: uIntImage,
                  ),
                ),
              );

              if (editedImage != null) {
                final newImage = await File(filePath + DateTime.now().toString()).create();
                await newImage.writeAsBytes(editedImage);

                setState(() {
                  mediaFile = newImage;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30,),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                children: [
                  Heading3("Edit"),
                  width(5),
                  Icon(
                    Icons.edit,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
