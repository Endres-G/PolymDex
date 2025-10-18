import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/view/widgets/search_widget.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool showSearchBar = Get.arguments?['showSearchBar'] ?? true;

    return Scaffold(
      backgroundColor: DesignSystemColors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Botão de voltar
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Get.back(),
            ),

            const SizedBox(height: 12),

            // Barra de pesquisa opcional
            if (showSearchBar) ...[
              const Center(child: SearchWidget()),
              const SizedBox(height: 28),
            ],

            // Texto de título
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
                textAlign: TextAlign
                    .center, // mantém centralizado visualmente quando o Align é center
              ),
            ),

            const SizedBox(height: 16),

            // Lista de resultados
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: DesignSystemColors.grey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: DesignSystemColors.lightgrey,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Linha com nome e ID
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Poliestireno',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                'ID: 58158',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Densidade: 1,05 g/cm³\nMFI: 25 g/10 min',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
