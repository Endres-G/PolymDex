import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';

/// Step 1 – seleção de polímero e produtor
class PolymerStep extends GetView<HomeController> {
  const PolymerStep({super.key});

  @override
  Widget build(BuildContext context) {
    final polymers = ['PE', 'PP'];
    final producers =
        controller.productService.producers; // lista vinda do service

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ------------------ POLYMER ------------------
          const Text(
            'Escolha o polímero',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            children: polymers.map((polymer) {
              return Obx(() {
                final selected =
                    controller.productService.selectedPolymer.value == polymer;
                return GestureDetector(
                  onTap: () {
                    controller.productService.selectPolymer(polymer);
                    print(
                      '[CreateProductView] -> Polymer selecionado: $polymer',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? Colors.white : Colors.grey[900],
                      border: Border.all(
                        color: selected ? Colors.white : Colors.grey[700]!,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      polymer,
                      style: TextStyle(
                        color: selected ? Colors.black : Colors.white70,
                        fontWeight: selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),

          const SizedBox(height: 32),

          // ------------------ PRODUCER ------------------
          const Text(
            'Escolha o produtor',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: producers.map((prod) {
              return Obx(() {
                final selected =
                    controller.productService.selectedProducer.value == prod;
                return GestureDetector(
                  onTap: () {
                    if (controller.productService.selectedProducer.value ==
                        prod) {
                      controller.productService.selectedProducer.value = '';
                    } else {
                      controller.productService.selectProducer(prod);
                    }

                    print(
                      '[CreateProductView] -> Produtor selecionado: ${controller.productService.selectedProducer.value}',
                    );
                  },

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selected ? Colors.white : Colors.grey[900],
                      border: Border.all(
                        color: selected ? Colors.white : Colors.grey[700]!,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      prod,
                      style: TextStyle(
                        color: selected ? Colors.black : Colors.white70,
                        fontWeight: selected
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              });
            }).toList(),
          ),
        ],
      ),
    );
  }
}
