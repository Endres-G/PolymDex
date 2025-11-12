import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/core/themes/typography_system.dart';

class FiltersView extends GetView<HomeController> {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> steps = [
      const StepPlaceholder(title: 'Step 1 - Polymers', itemCount: 12),
      const StepPlaceholder(title: 'Step 2 - MI / Density', itemCount: 6),
      const StepPlaceholder(title: 'Step 3 - Additives', itemCount: 8),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: controller.handleBack, // agora a lógica tá no controller
        ),
        title: const Text('Filtros', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () {},
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
                      }
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

class StepPlaceholder extends StatelessWidget {
  final String title;
  final int itemCount;
  const StepPlaceholder({
    required this.title,
    required this.itemCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final items = List.generate(itemCount, (i) => 'Lorem ipsum ${i + 1}');
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: items.map((t) => _placeholderChip(t)).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Descrição (placeholder)',
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 6),
          const Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero.',
            style: TextStyle(color: Colors.white38),
          ),
        ],
      ),
    );
  }

  Widget _placeholderChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border.all(color: Colors.grey[700]!),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label, style: const TextStyle(color: Colors.white70)),
    );
  }
}
