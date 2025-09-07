 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:polymdex/core/routes/app_pages.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/themes/design_system.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await AppEnv.loadEnv();
  // print("Base URL carregada: ${AppEnv.baseUrl}");
  // Get.put<GlobalController>(GlobalController(), permanent: true);

  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
    theme: ThemeData.dark().copyWith(
  scaffoldBackgroundColor: DesignSystemColors.black,
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme,
  ),)
);

     
  }
}