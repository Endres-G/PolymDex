import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/typography_system.dart';

/// ------------------------------------------------------------
/// 🔹 Step 2 - MI / Density (slider + input numérico)
/// ------------------------------------------------------------
class MiDensityStep extends GetView<HomeController> {
  const MiDensityStep({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Step 2 - Índice de Fluidez (MI) e Densidade',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 24),

          /// Índice de Fluidez (MI)
          Text(
            'Índice de Fluidez (MI)',
            style: TypographySystem.buttonText.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: Slider(
                    value: controller.mi.value,
                    min: 0.05,
                    max: 20.0,
                    divisions: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey[700],
                    onChanged: (v) => controller.mi.value = v,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 70,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (v) =>
                        controller.mi.value = double.tryParse(v) ?? 0,
                    controller: TextEditingController(
                      text: controller.mi.value.toStringAsFixed(2),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          /// Densidade
          Text(
            'Densidade',
            style: TypographySystem.buttonText.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: Slider(
                    value: controller.density.value,
                    min: 0.800,
                    max: 1.000,
                    divisions: 30,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey[700],
                    onChanged: (v) => controller.density.value = v,
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 70,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[900],
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                    ),
                    onChanged: (v) =>
                        controller.density.value = double.tryParse(v) ?? 0.0,
                    controller: TextEditingController(
                      text: controller.density.value.toStringAsFixed(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
