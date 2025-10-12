import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/view/widgets/recent_search_widget.dart';
import 'package:polymdex/view/widgets/search_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 108, horizontal: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                );
              } else {
                return Text(
                  "Olá, ${controller.userName.value}!",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                );
              }
            }),

            SizedBox(height: 12),
            Align(alignment: AlignmentGeometry.center, child: SearchWidget()),
            SizedBox(height: 31),
            Text("Buscas Recentes"),
            SizedBox(height: 8),

            Row(
              children: [
                RecentSearchWidget(productName: "Polysesr"),
                SizedBox(width: 8),

                RecentSearchWidget(productName: "polyesterds"),
              ],
            ),
            SizedBox(height: 25),
            Text("Oque está buscando?"),
            SizedBox(height: 12),

            Container(
              decoration: BoxDecoration(
                color: DesignSystemColors.grey,
                border: Border.all(color: DesignSystemColors.lightgrey),
                borderRadius: BorderRadius.circular(32),
              ),
              width: 334,
              height: 178,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.file_upload_outlined, size: 60),
                  SizedBox(height: 8),
                  Text("Carregar Novo Produto"),
                ],
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                color: DesignSystemColors.grey,
                border: Border.all(color: DesignSystemColors.lightgrey),
                borderRadius: BorderRadius.circular(32),
              ),
              width: 334,
              height: 178,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.filter_alt_outlined, size: 60),
                  SizedBox(height: 8),
                  Text("Pesquisa avançada"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
