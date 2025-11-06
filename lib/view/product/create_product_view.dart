import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/core/themes/typography_system.dart';
import 'package:polymdex/view/filters_view.dart';
import 'package:polymdex/view/product/step_1_view.dart';
import 'package:polymdex/view/product/step_2_view.dart';

class CreateProductView extends GetView<HomeController> {
  const CreateProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      const PolymerStep(),
      const MiDensityStep(), // 🔹 Step 2 substituído aqui
      const StepPlaceholder(title: 'Step 3 - Additives', itemCount: 8),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: controller.handleBack,
        ),
        title: const Text(
          'Criar Produto',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () async {
                await controller.saveProductToIsar();
                Get.snackbar(
                  'Sucesso',
                  'Produto salvo no Isar!',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[800],
                shape: const StadiumBorder(),
              ),
              child: const Text('Buscar'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            final currentStep = controller.currentStep.value;

            return Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Etapa ${currentStep + 1} de ${steps.length}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                const SizedBox(height: 12),

                Expanded(child: steps[currentStep]),

                SizedBox(
                  height: 46,
                  width: 334,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentStep < steps.length - 1) {
                        controller.currentStep.value++;
                        print(
                          '[CreateProductView] -> Avançou para etapa ${controller.currentStep.value + 1}',
                        );
                      } else {
                        Get.snackbar(
                          'Etapas',
                          'Todas as etapas concluídas',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                      print(
                        '[CreateProductView] -> Seleções até agora: ${controller.productService.selections.join(', ')}',
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DesignSystemColors.lightgrey,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      currentStep < steps.length - 1
                          ? 'Próxima etapa'
                          : 'Finalizar',
                      style: TypographySystem.buttonText,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _StepIndicator(current: currentStep, total: steps.length),
                const SizedBox(height: 12),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int current;
  final int total;

  const _StepIndicator({required this.current, required this.total, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final bool active = index <= current;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 28 : 18,
          height: 6,
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.grey[700],
            borderRadius: BorderRadius.circular(6),
          ),
        );
      }),
    );
  }
}
