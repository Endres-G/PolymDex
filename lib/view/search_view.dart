import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/view/widgets/data_container_widget.dart';
import 'package:polymdex/view/widgets/search_widget.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 Pegamos a flag diretamente dos argumentos, mas deixamos default = false
    final bool showSearchBar = Get.arguments?['showSearchBar'] ?? false;

    return Scaffold(
      backgroundColor: DesignSystemColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Botão voltar
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  controller.filteredProducts.clear();
                  Get.back();
                },
              ),

              const SizedBox(height: 12),

              // 🔹 Campo de busca opcional
              if (showSearchBar) ...[
                const Center(child: SearchWidget(isInHome: false)),
                const SizedBox(height: 28),
              ],

              Align(
                alignment: showSearchBar
                    ? Alignment.centerLeft
                    : Alignment.center,
                child: const Text(
                  'Produtos com as características filtradas:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 16),

              // 🔹 Lista observável
              Expanded(
                child: Obx(() {
                  final products = controller.filteredProducts;

                  debugPrint(
                    '[SearchView] 📦 Produtos visíveis: ${products.length}',
                  );

                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    );
                  }

                  if (products.isEmpty) {
                    return const Center(
                      child: Text(
                        'Nenhum produto encontrado.',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  return ListView.separated(
                    itemCount: products.length,
                    separatorBuilder: (_, __) => const SizedBox(
                      height: 16,
                    ), // 🔹 espaçamento entre cards
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return DataContainerWidget(product: product);
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
