import 'dart:io';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rabuh/screens/select_image_and_caption_screen.dart';

class CameraScreen extends StatefulWidget {
  final TabController _tabController;
  CameraScreen(this._tabController, {super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          widget._tabController.animateTo(1, duration: Duration(seconds: 1));
          return false;
        },
        child: Container(
          color: Colors.white,
          child: CameraAwesomeBuilder.awesome(
            progressIndicator: Container(
              color: Colors.black,
            ),
            sensor: Sensors.front,
            aspectRatio: CameraAspectRatios.ratio_16_9,
            saveConfig: SaveConfig.photoAndVideo(
              initialCaptureMode: CaptureMode.photo,
              photoPathBuilder: () async {
                final Directory extDir = await getTemporaryDirectory();
                final testDir = await Directory(
                  '${extDir.path}/camerawesome',
                ).create(recursive: true);

                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                print(filePath);
                return filePath;
              },
              videoPathBuilder: () async {
                final Directory extDir = await getTemporaryDirectory();
                final testDir = await Directory(
                  '${extDir.path}/camerawesome',
                ).create(recursive: true);

                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.mp4';
                print(filePath);
                return filePath;
              },
            ),
            enablePhysicalButton: true,
            // filter: AwesomeFilter.AddictiveRed,
            previewAlignment: Alignment.center,
            previewFit: CameraPreviewFit.contain,
            onMediaTap: (mediaCapture) {
              print("PHOTO CLICKED: ${mediaCapture.filePath}");
              widget._tabController.animateTo(1);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SelectImageAndCaptionScreen(mediaCapture.filePath,)));
            },
            enableAudio: true,

          ),
        ),
      ),
    );
  }
}