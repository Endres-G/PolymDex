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
    final bool showSearchBar = Get.arguments?['showSearchBar'] ?? false;

    return Scaffold(
      backgroundColor: DesignSystemColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  controller.filteredProducts.clear();
                  Get.back();
                },
              ),

              const SizedBox(height: 12),

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
                ),
              ),

              const SizedBox(height: 16),

              // 🔥🔥🔥 CABEÇALHO FIXO AQUI 🔥🔥🔥
              Row(
                children: const [
                  _HeaderCell('Grade', sublabel: '', width: 95),

                  _HeaderCell('MFI', sublabel: '(g/10 min)', width: 83),

                  _HeaderCell('Dens.', sublabel: '(g/cm³)', width: 70),

                  Expanded(
                    child: _HeaderCell('Comon.', sublabel: '', width: 60),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Expanded(
                child: Obx(() {
                  final products = controller.filteredProducts;

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
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
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

class _HeaderCell extends StatelessWidget {
  final String label;
  final String sublabel;
  final double width;

  const _HeaderCell(
    this.label, {
    required this.sublabel,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // 🔥 CENTRALIZA TUDO
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (sublabel.isNotEmpty)
            Text(
              sublabel,
              style: const TextStyle(color: Colors.white70, fontSize: 10),
            ),
        ],
      ),
    );
  }
}
