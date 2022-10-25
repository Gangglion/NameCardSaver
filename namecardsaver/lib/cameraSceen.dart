import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namecardsaver/startSceen.dart';

class cameraWidget extends StatefulWidget {
  final CameraDescription firstCanera;
  cameraWidget({super.key, required this.firstCanera});
  @override
  State<cameraWidget> createState() => _cameraWidgetState();
}

class _cameraWidgetState extends State<cameraWidget> {
  static const platform =
      const MethodChannel('com.glion.namecardsaver/android'); // 채널생성자로 전달될 채널
  late CameraController controller;
  late Future<void> _initializeControllerFuture;
  @override
  void initState() {
    super.initState();

    controller = CameraController(widget.firstCanera, ResolutionPreset.medium);
    _initializeControllerFuture = controller.initialize();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('명함을 촬영하세요.')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return CameraPreview(controller);
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await controller.takePicture();
            if (!mounted) return;
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureScreen(imagePath: image.path),
              ),
            );
          } catch (e) {
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;
  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // 이미지는 디바이스에 파일로 저장됩니다. 이미지를 보여주기 위해 주어진
      // 경로로 `Image.file`을 생성하세요.
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.5,
              margin: const EdgeInsets.all(8.0),
              child: Image.file(File(imagePath)),
            ),
            Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.1,
                margin: const EdgeInsets.only(left: 10, top: 50, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    // 사진 경로 안드로이드로 보내서 처리하기
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text("저장하기"),
                )),
            Container(
                width: double.infinity,
                height: (MediaQuery.of(context).size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.1,
                margin: const EdgeInsets.only(left: 10, top: 50, right: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey),
                  child: const Text("다시 촬영하기"),
                )),
          ],
        ),
      ),
    );
  }
}
