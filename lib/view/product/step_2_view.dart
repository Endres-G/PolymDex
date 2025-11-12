import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/typography_system.dart';

/// ------------------------------------------------------------
/// 🔹 Step 2 - Grade / MI / Density
/// ------------------------------------------------------------
class MiDensityStep extends GetView<HomeController> {
  const MiDensityStep({super.key});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Step 2 - Grade, Índice de Fluidez (MI) e Densidade',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 24),

          /// ------------------------------------------------------------
          /// GRADE
          /// ------------------------------------------------------------
          Text(
            'Grade',
            style: TypographySystem.buttonText.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: c.gradeController,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Digite o grade...',
              hintStyle: const TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.grey[900],
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
            ),
            onChanged: (value) {
              c.productService.grade.value = value;
              c.productService.addSelection('Grade', value);
            },
          ),

          const SizedBox(height: 32),

          /// ------------------------------------------------------------
          /// ÍNDICE DE FLUIDEZ (MI)
          /// ------------------------------------------------------------
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
                    value: c.mi.value,
                    min: 0.05,
                    max: 20.0,
                    divisions: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey[700],
                    onChanged: (v) {
                      c.mi.value = v;
                      c.miController.text = v.toStringAsFixed(2);
                      c.productService.addSelection('MI', v.toStringAsFixed(2));
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 70,
                  child: TextField(
                    controller: c.miController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '0.00',
                      hintStyle: const TextStyle(color: Colors.white54),
                      filled: true,
                      fillColor: Colors.grey[900],
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    onChanged: (value) {
                      final v = double.tryParse(value) ?? 0.0;
                      c.mi.value = v;
                      c.productService.addSelection('MI', v.toStringAsFixed(2));
                    },
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          /// ------------------------------------------------------------
          /// DENSIDADE
          /// ------------------------------------------------------------
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
                    value: c.density.value,
                    min: 0.800,
                    max: 1.000,
                    divisions: 30,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey[700],
                    onChanged: (v) {
                      c.density.value = v;
                      c.densityController.text = v.toStringAsFixed(3);
                      c.productService.addSelection(
                        'Density',
                        v.toStringAsFixed(3),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 70,
                  child: TextField(
                    controller: c.densityController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: '0.000',
                      hintStyle: const TextStyle(color: Colors.white54),
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
                    onChanged: (value) {
                      final val = double.tryParse(value) ?? 0.0;
                      c.density.value = val;
                      c.productService.addSelection(
                        'Density',
                        val.toStringAsFixed(3),
                      );
                    },
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
