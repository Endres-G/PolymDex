import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/core/themes/typography_system.dart';

class AdditivesStep extends StatefulWidget {
  const AdditivesStep({super.key});

  @override
  State<AdditivesStep> createState() => _AdditivesStepState();
}

class _AdditivesStepState extends State<AdditivesStep> {
  final HomeController controller = Get.find<HomeController>();
  final productService = Get.find<HomeController>().productService;
  bool? antioxidant;
  bool? antiblock;
  bool? slip;
  bool? processingAid;

  final Map<String, bool> otherAdds = {
    'UV Stabilizer': false,
    'Flame Retardant': false,
    'Antistatic': false,
    'Impact Modifiers': false,
    'Pigments': false,
    'Fillers': false,
    'Plasticizers': false,
  };

  final TextEditingController otherController = TextEditingController();
  final List<String> customOthers = [];

  @override
  void initState() {
    super.initState();
    _loadFromSelections();
  }

  void _loadFromSelections() {
    final sels = productService.selections;
    for (final s in sels) {
      if (s.startsWith('Antioxidant:')) {
        antioxidant = s.split(':')[1] == 'Sim';
      } else if (s.startsWith('Antiblock:')) {
        antiblock = s.split(':')[1] == 'Sim';
      } else if (s.startsWith('Slip:')) {
        slip = s.split(':')[1] == 'Sim';
      } else if (s.startsWith('ProcessingAid:')) {
        processingAid = s.split(':')[1] == 'Sim';
      } else if (s.startsWith('Additive:')) {
        final name = s.substring('Additive:'.length);
        if (otherAdds.containsKey(name)) otherAdds[name] = true;
      } else if (s.startsWith('OtherAdd:')) {
        final name = s.substring('OtherAdd:'.length);
        if (name.isNotEmpty && !customOthers.contains(name)) {
          customOthers.add(name);
        }
      }
    }
    setState(() {});
  }

  void _setFlag(String key, bool value) {
    final existingIndex = productService.selections.indexWhere(
      (s) => s.startsWith('$key:'),
    );
    final entryValue = '$key:${value ? 'Sim' : 'Nao'}';
    if (existingIndex >= 0) {
      productService.selections[existingIndex] = entryValue;
    } else {
      productService.selections.add(entryValue);
    }
  }

  void _toggleAdditive(String name, bool value) {
    final entry = 'Additive:$name';
    if (value) {
      if (!productService.selections.contains(entry)) {
        productService.selections.add(entry);
      }
    } else {
      productService.selections.removeWhere((s) => s == entry);
    }
  }

  Widget _buildYesNoRow(String label, bool? value, Function(bool) onChanged) {
    final isYes = value == true;
    final isNo = value == false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TypographySystem.wbuttonText),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isYes
                      ? DesignSystemColors.lightgrey
                      : DesignSystemColors.grey,
                ),
                onPressed: () => onChanged(true),
                child: Text(
                  'Sim',
                  style: TypographySystem.wbuttonText.copyWith(
                    color: isYes ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isNo
                      ? DesignSystemColors.lightgrey
                      : DesignSystemColors.grey,
                ),
                onPressed: () => onChanged(false),
                child: Text(
                  'Não',
                  style: TypographySystem.wbuttonText.copyWith(
                    color: isNo ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  @override
  void dispose() {
    otherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildYesNoRow('Antioxidante', antioxidant, (v) {
            setState(() => antioxidant = v);
            _setFlag('Antioxidant', v);
          }),

          _buildYesNoRow('Antiblock', antiblock, (v) {
            setState(() => antiblock = v);
            _setFlag('Antiblock', v);
          }),

          _buildYesNoRow('Slip', slip, (v) {
            setState(() => slip = v);
            _setFlag('Slip', v);
          }),

          _buildYesNoRow('Processing Aid (TDD)', processingAid, (v) {
            setState(() => processingAid = v);
            _setFlag('ProcessingAid', v);
          }),

          const Divider(),

          /// ---------------------------
          /// 🔹 Other Adds - reformulado
          /// ---------------------------
          const Text(
            'Other Adds',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 16),

          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: otherAdds.keys.map((name) {
              final selected = otherAdds[name] ?? false;
              return GestureDetector(
                onTap: () {
                  final newValue = !selected;
                  setState(() => otherAdds[name] = newValue);
                  _toggleAdditive(name, newValue);
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
