import 'package:get/get.dart';
import 'package:polymdex/bindings/home_binding.dart';
import 'package:polymdex/bindings/login_bindings.dart';
import 'package:polymdex/bindings/splash_binding.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/view/home_view.dart';
import 'package:polymdex/view/login_view.dart';
import 'package:polymdex/view/search_view.dart';
import 'package:polymdex/view/splash_view.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBindings(),
    ),

    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
      binding: HomeBinding(),
    ),
  ];
}
