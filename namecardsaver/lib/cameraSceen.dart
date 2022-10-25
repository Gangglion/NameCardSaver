import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  void initState() {
    super.initState();
    controller = CameraController(widget.firstCanera, ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('User denied camera access.');
            break;
          default:
            print('Handle other errors.');
            break;
        }
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[
              CameraPreview(controller),
            ],
          ),
        ));
  }
}
