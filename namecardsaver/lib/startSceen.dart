import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:namecardsaver/saveSceen.dart';

void main() {
  runApp(const TakeSceen());
}

class TakeSceen extends StatelessWidget {
  const TakeSceen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]); // 하단바만 남기고 상단 상태표시줄 안보이게함
    return MaterialApp(
      title: 'NameCardSaver',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false, // 상단 우측 디버그 리본 숨기기
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentPage < 3) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: (MediaQuery.of(context).size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.6,
              margin: const EdgeInsets.all(10),
              child: PageView(
                controller: _pageController,
                children: [
                  // TODO : 명함 촬영과 저장되는 과정을 보여줄 수 있는 이미지를 올릴 예정
                  Container(color: Colors.red),
                  Container(color: Colors.blue),
                  Container(color: Colors.green),
                ],
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
                  Navigator.push(context, MaterialPageRoute(builder : (context) => const SaveSceen()));
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                child: const Text("명함 촬영하기"),
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
                  if (Platform.isIOS) {
                    exit(0);
                  } else {
                    SystemNavigator.pop();
                  }
                },
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey),
                child: const Text("앱 종료하기"),
              )),
        ],
      ),
    );
  }
}