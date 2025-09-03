import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/splash_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/core/utils/app_assets.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: DesignSystemColors.black,
        width: double.infinity,  
        height: double.infinity,          
        child: Center(
          child: SizedBox(
            width: 221,
            height: 167,
             child: Image.asset(
              AppAssets.logo,  
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}