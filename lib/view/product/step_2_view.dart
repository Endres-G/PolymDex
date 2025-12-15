import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/typography_system.dart';

/// ------------------------------------------------------------
/// 🔹 Step 2 - MI / Density
/// ------------------------------------------------------------
class MiDensityStep extends GetView<HomeController> {
  final bool isFilter;

  const MiDensityStep({super.key, this.isFilter = false});

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          /// ============================================================
          /// MI
          /// ============================================================
          Text(
            'Índice de Fluidez (MI)',
            style: TypographySystem.buttonText.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),

          Obx(() {
            /// 🔹 MODO FILTRO (INTERVALO)
            if (isFilter) {
              return RangeSlider(
                values: c.miRange.value,
                min: 0.05,
                max: 20.0,
                divisions: 100,
                activeColor: Colors.white,
                inactiveColor: Colors.grey[700],
                labels: RangeLabels(
                  c.miRange.value.start.toStringAsFixed(2),
                  c.miRange.value.end.toStringAsFixed(2),
                ),
                onChanged: (range) {
                  c.miRange.value = range;

                  c.productService.addSelection(
                    'MI',
                    '${range.start.toStringAsFixed(2)} - ${range.end.toStringAsFixed(2)}',
                  );
                },
              );
            }

            /// 🔹 MODO NORMAL (VALOR ÚNICO)
            return Row(
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
                _numberField(
                  controller: c.miController,
                  hint: '0.00',
                  onChanged: (value) {
                    final v = double.tryParse(value) ?? 0.0;
                    c.mi.value = v;
                    c.productService.addSelection('MI', v.toStringAsFixed(2));
                  },
                ),
              ],
            );
          }),

          const SizedBox(height: 24),

          /// ============================================================
          /// DENSITY
          /// ============================================================
          Text(
            'Densidade',
            style: TypographySystem.buttonText.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),

          Obx(() {
            /// 🔹 MODO FILTRO (INTERVALO)
            if (isFilter) {
              return RangeSlider(
                values: c.densityRange.value,
                min: 0.800,
                max: 1.000,
                divisions: 30,
                activeColor: Colors.white,
                inactiveColor: Colors.grey[700],
                labels: RangeLabels(
                  c.densityRange.value.start.toStringAsFixed(3),
                  c.densityRange.value.end.toStringAsFixed(3),
                ),
                onChanged: (range) {
                  c.densityRange.value = range;

                  c.productService.addSelection(
                    'Density',
                    '${range.start.toStringAsFixed(3)} - ${range.end.toStringAsFixed(3)}',
                  );
                },
              );
            }

            /// 🔹 MODO NORMAL (VALOR ÚNICO)
            return Row(
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
                _numberField(
                  controller: c.densityController,
                  hint: '0.000',
                  onChanged: (value) {
                    final v = double.tryParse(value) ?? 0.0;
                    c.density.value = v;
                    c.productService.addSelection(
                      'Density',
                      v.toStringAsFixed(3),
                    );
                  },
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  /// ============================================================
  /// 🔹 Campo numérico reutilizável
  /// ============================================================
  Widget _numberField({
    required TextEditingController controller,
    required String hint,
    required Function(String) onChanged,
  }) {
    return SizedBox(
      width: 70,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
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
        onChanged: onChanged,
      ),
    );
  }
}
