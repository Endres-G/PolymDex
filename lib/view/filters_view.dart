import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/core/themes/typography_system.dart';
import 'package:polymdex/view/product/step_1_view.dart';
import 'package:polymdex/view/product/step_2_view.dart';
import 'package:polymdex/view/product/step_3_view.dart';
import 'package:polymdex/view/product/step_4_view.dart';

class FiltersView extends GetView<HomeController> {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      const PolymerStep(),
      const MiDensityStep(isFilter: true),
      const AdditivesStep(),
      const ComonomerStep(),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: controller.handleBack,
        ),
        title: const Text('Filtros', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () async {
                      await controller.loadFilteredProducts();
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: DesignSystemColors.lightgrey,
                shape: const StadiumBorder(),
              ),
              child: Obx(
                () => controller.isLoading.value
                    ? const SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.black,
                        ),
                      )
                    : const Text(
                        'Buscar',
                        style: TextStyle(color: Colors.black),
                      ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Obx(() {
          final currentStep = controller.currentStep.value;
          final isLastStep = currentStep == steps.length - 1;

          // Se estiver carregando produtos, mostra o indicador
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          // Se houver resultados filtrados, mostra lista
          if (controller.filteredProducts.isNotEmpty && isLastStep) {
            return _FilteredProductsList();
          }

          // Caso contrário, mostra as etapas de filtro
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
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

                const SizedBox(height: 12),
                SizedBox(
                  height: 46,
                  width: 334,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (currentStep < steps.length - 1) {
                        controller.currentStep.value++;
                      } else {
                        await controller.loadFilteredProducts();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: DesignSystemColors.lightgrey,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      currentStep < steps.length - 1
                          ? 'Próxima etapa'
                          : 'Buscar Produtos',
                      style: TypographySystem.buttonText,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                _StepIndicator(current: currentStep, total: steps.length),
                const SizedBox(height: 12),
              ],
            ),
          );
        }),
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

class _FilteredProductsList extends GetView<HomeController> {
  const _FilteredProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = controller.filteredProducts;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resultados da busca:',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.separated(
              itemCount: products.length,
              separatorBuilder: (_, __) => const Divider(color: Colors.white24),
              itemBuilder: (_, i) {
                final p = products[i];
                return ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: Colors.grey[900],
                  title: Text(
                    p.grade ?? 'Sem grade',
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    'MI: ${p.mi} | Densidade: ${p.density}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
