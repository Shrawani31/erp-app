import 'package:erp_app/Pages/AppStartScreen.dart';
import 'package:erp_app/Pages/login_page_screen.dart';
import 'package:erp_app/Routes.dart';
import 'package:erp_app/controllers/UserController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:video_player/video_player.dart';

import '../model/DashboardResponce.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  final userdata = GetStorage();

  //late FlutterGifController controller;

  @override
  void initState() {
    super.initState();
    userdata.writeIfNull('isLoggedin', false);

    // Initialize the video player
    _controller = VideoPlayerController.asset('assets/splash.mp4')
      ..initialize().then((_) {
        setState(() {
          _isPlaying = true;
        });

        // Play the video and set a 5 second timer before navigating to the next screen
        _controller.setPlaybackSpeed(0.3);
        _controller.play();
        Future.delayed(Duration(seconds: 5), () {
          _controller.pause();
          checkIfLogged();
          // Get.toNamed(MyRoutes.AppStartScreenroute);
          // Navigator.pushReplacementNamed(context, '/AppStartScreen');
        });
      });

    // controller = FlutterGifController(vsync: this);

    //controller.repeat(
    //    min: 500, max: 100, period: const Duration(milliseconds: 3000));
  }

  void checkIfLogged() {
    bool isLogged = userdata.read('isRememberMe') == true;
    print(isLogged);
    if (isLogged) {
      Get.offAllNamed(MyRoutes.Dashboardroute);
    } else {
      Get.offAllNamed(MyRoutes.Loginroute);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: GifImage(
      //   // width: MediaQuery.of(context).size.width,
      //   height: MediaQuery.of(context).size.height,
      //   fit: BoxFit.fitHeight,
      //   controller: controller,
      //   image: const AssetImage("assets/splash.gif"),
      // ),

      body: Stack(
        children: [
          // Show the video player
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: _isPlaying
                  ? AspectRatio(
                      //aspectRatio: _controller.value.aspectRatio,
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Container(),
            ),
          ),

          // Show a loading indicator while the video is loading
          Center(
            child: !_isPlaying ? CircularProgressIndicator() : Container(),
          ),
        ],
      ),
    );
  }
}
