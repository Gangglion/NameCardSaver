import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SaveSceen extends StatelessWidget {
  const SaveSceen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays(
        [SystemUiOverlay.bottom]); // 하단바만 남기고 상단 상태표시줄 안보이게함
    return MaterialApp(
      title: 'NameCardSaver',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false, // 상단 우측 디버그 리본 숨기기
      home: SaveWidget(),
    );
  }
}

class SaveWidget extends StatefulWidget {
  const SaveWidget({super.key});

  @override
  State<SaveWidget> createState() => _SaveWidgetState();
}

class _SaveWidgetState extends State<SaveWidget> {
  static const platform =
      const MethodChannel('com.glion.namecardsaver/android'); // 채널생성자로 전달될 채널


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: <Widget>[],
          ),
        ));
  }
}
