import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/typography_system.dart';

/// ------------------------------------------------------------
/// 🔹 Step 2 - Grade / MI / Density
/// ------------------------------------------------------------
class MiDensityStep extends GetView<HomeController> {
  final bool isFilter;

  const MiDensityStep({
    super.key,
    this.isFilter = false, // padrão: modo normal
  });

  @override
  Widget build(BuildContext context) {
    final c = controller;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),

          /// ------------------------------------------------------------
          /// GRADE
          /// ------------------------------------------------------------
          Text(
            'Grade',
            style: TypographySystem.buttonText.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 8),

          if (!isFilter)
            /// Campo de texto normal
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
            )
          else
            /// Botão para abrir diálogo de seleção de Grade
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[900],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () async {
                // 🔹 Buscar grades reais do banco via ProductService
                final grades = await c.productService.getAllGrades();

                if (grades.isEmpty) {
                  Get.snackbar(
                    'Aviso',
                    'Nenhum grade encontrado no banco.',
                    backgroundColor: Colors.grey[850],
                    colorText: Colors.white,
                  );
                  return;
                }

                Get.dialog(
                  Dialog(
                    backgroundColor: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        final Map<String, bool> selectedGrades = {
                          for (var g in grades) g: false,
                        };

                        return Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Selecione um Grade',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),

                              /// 🔹 Chips dinâmicos de grades reais
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: grades.map((name) {
                                  final selected =
                                      selectedGrades[name] ?? false;
                                  return GestureDetector(
                                    onTap: () {
                                      // Apenas um selecionado por vez
                                      setState(() {
                                        for (var key in selectedGrades.keys) {
                                          selectedGrades[key] = false;
                                        }
                                        selectedGrades[name] = true;
                                      });
                                      // Atualiza controller e fecha
                                      c.gradeController.text = name;
                                      c.productService.addSelection(
                                        'Grade',
                                        name,
                                      );
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: selected
                                            ? Colors.white
                                            : Colors.grey[900],
                                        border: Border.all(
                                          color: selected
                                              ? Colors.white
                                              : Colors.grey[700]!,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          color: selected
                                              ? Colors.black
                                              : Colors.white70,
                                          fontWeight: selected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),

                              const SizedBox(height: 24),
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () => Get.back(),
                                  child: const Text(
                                    'Fechar',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
              child: const Text('Selecionar Grade'),
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
