import 'dart:io';

import 'package:camera/camera.dart';
import 'package:file_utils/file_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rabuh/widgets/headings.dart';
import 'package:rabuh/widgets/margins.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  dynamic cameraList, cameraController, cameraInit;
  int cameraIndex = 1;
  String? capturedImage;
  bool showCapturedPic = false;

  @override
  void initState() {
    super.initState();
    findCamera();
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (cameraController != null)
            ? ((showCapturedPic == false)
                ? displayCameraPreview()
                : displayCapturedPic())
            : SizedBox.shrink(),
      ),
      floatingActionButton: (showCapturedPic) ? null : Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          onPressed: () async {
            await cameraInit;

            final image = await cameraController.takePicture();

            setState(() {
              capturedImage = image.path;
              showCapturedPic = true;
            });
          },
          backgroundColor: Colors.greenAccent,
          child: Icon(
            Icons.circle,
            size: 70,
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }

  Widget displayCameraPreview() {
    return Center(
      child: Stack(
        children: [
          CameraPreview(
            cameraController,
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: InkWell(
              onTap: () async {
                cameraIndex = 1 - cameraIndex;
                cameraController = CameraController(
                    cameraList[cameraIndex], ResolutionPreset.max);
                cameraInit = await cameraController.initialize();
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(
                  5,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.cameraswitch_sharp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void findCamera() async {
    final cameras = await availableCameras();
    cameraList = cameras;
    cameraController = CameraController(cameras[1], ResolutionPreset.ultraHigh);
    cameraInit = await cameraController.initialize();
    setState(() {});
  }

  Widget displayCapturedPic() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 70 / 100,
          child: Image.file(
            File(
              capturedImage!,
            ),
          ),
        ),
        height(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showCapturedPic = false;
                });
              },
              child: Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  FontAwesomeIcons.times,
                  size: 38,
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Icon(
                  Icons.check,
                  size: 38,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
