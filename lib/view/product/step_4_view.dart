import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/typography_system.dart';

class ComonomerStep extends StatefulWidget {
  const ComonomerStep({super.key});

  @override
  State<ComonomerStep> createState() => _ComonomerStepState();
}

class _ComonomerStepState extends State<ComonomerStep> {
  final HomeController controller = Get.find<HomeController>();
  final productService = Get.find<HomeController>().productService;

  final List<String> comonomers = [
    'None',
    '1-Butene',
    '1-Hexene',
    '1-Octene',
    '1-Butene/1-hexene',
    '1-Butene/1-Hexene/Propene',
    'Vinyl Acetate',
  ];

  final List<String> mwdOptions = [
    'Narrow-Monomodal',
    'Medium-Monomodal',
    'Wide-Monomodal',
    'Wide-Bimodal',
  ];

  String? selectedComonomer;
  String? selectedMWD;

  @override
  void initState() {
    super.initState();
    _loadSelections();
  }

  void _loadSelections() {
    for (final s in productService.selections) {
      if (s.startsWith('Comonomer:')) {
        selectedComonomer = s.substring('Comonomer:'.length);
      } else if (s.startsWith('MWD:')) {
        selectedMWD = s.substring('MWD:'.length);
      } else if (s.startsWith('ComonomerContent:')) {
        final val = double.tryParse(s.split(':')[1]);
        if (val != null) controller.comonomerContent.value = val;
      }
    }
  }

  void _selectComonomer(String name) {
    setState(() => selectedComonomer = name);
    productService.addSelection('Comonomer', name);
  }

  void _selectMWD(String name) {
    setState(() => selectedMWD = name);
    productService.addSelection('MWD', name);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Seção: Comonomer
          Text('Comonomer', style: TypographySystem.wbuttonText),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: comonomers.map((name) {
              final selected = selectedComonomer == name;
              return GestureDetector(
                onTap: () => _selectComonomer(name),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : Colors.grey[900],
                    border: Border.all(
                      color: selected ? Colors.white : Colors.grey[700]!,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: selected ? Colors.black : Colors.white70,
                      fontWeight: selected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 32),

          /// 🔹 Seção: Comonomer Content (slider + input)
          Text('Comonomer Content', style: TypographySystem.wbuttonText),
          const SizedBox(height: 8),
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: Slider(
                    value: controller.comonomerContent.value.clamp(
                      0.828,
                      1.952,
                    ),
                    min: 0.828,
                    max: 1.952,
                    divisions: 100,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey[700],
                    onChanged: (v) {
                      controller.comonomerContent.value = v;
                      productService.addSelection(
                        'ComonomerContent',
                        v.toStringAsFixed(3),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
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
                    onChanged: (v) {
                      final parsed = double.tryParse(v);
                      if (parsed != null) {
                        controller.comonomerContent.value = parsed;
                        productService.addSelection(
                          'ComonomerContent',
                          parsed.toStringAsFixed(3),
                        );
                      }
                    },
                    controller: TextEditingController(
                      text: controller.comonomerContent.value.toStringAsFixed(
                        3,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          /// 🔹 Seção: MWD
          Text('MWD', style: TypographySystem.wbuttonText),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: mwdOptions.map((name) {
              final selected = selectedMWD == name;
              return GestureDetector(
                onTap: () => _selectMWD(name),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selected ? Colors.white : Colors.grey[900],
                    border: Border.all(
                      color: selected ? Colors.white : Colors.grey[700]!,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: selected ? Colors.black : Colors.white70,
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
        ],
      ),
    );
  }
}
