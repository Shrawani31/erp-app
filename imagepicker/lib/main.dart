import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Obx(
              () => _controller.compressImagePath.value == ''
                  ? const Text(
                      'Select image from camera/galley',
                      style: TextStyle(fontSize: 20),
                    )
                  : Image.file(
                      File(_controller.compressImagePath.value),
                      width: double.infinity,
                      height: 300,
                    ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(() => Text(
                  _controller.compressImageSize.value == ''
                      ? ''
                      : _controller.compressImageSize.value,
                  style: const TextStyle(fontSize: 20),
                )),
            TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {
                _controller.getImage(ImageSource.camera);
              },
              child: const Text('Camera'),
            ),
            TextButton(
              style: TextButton.styleFrom(),
              onPressed: () {
                _controller.getImage(ImageSource.gallery);
              },
              child: const Text('Gallery'),
            ),
            // TextButton(
            //   style: TextButton.styleFrom(),
            //   onPressed: () {
            //     // _controller.uploadImage();
            //   },
            //   child: const Text('Uplode'),
            // )
          ],
        ),
        // Obx(() {
        //   return Expanded(
        //       child: GridView.builder(
        //           gridDelegate:
        //               const SliverGridDelegateWithFixedCrossAxisCount(
        //                   crossAxisCount: 3,
        //                   crossAxisSpacing: 16,
        //                   mainAxisSpacing: 16),
        //           itemBuilder: ((context, index) {
        //             return Image.file(
        //               File(_controller.listImagepath[index]),
        //               width: 100,
        //               height: 100,
        //               fit: BoxFit.cover,
        //             );
        //           })));
        // }
        // ),
      ),
    );
  }
}
