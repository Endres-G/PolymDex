import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';

class DocumentStep extends StatelessWidget {
  const DocumentStep({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Documento do Produto",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(height: 16),

        GestureDetector(
          onTap: () async {
            final result = await FilePicker.platform.pickFiles(
              allowMultiple: false,
              withData: true,
            );

            if (result != null && result.files.isNotEmpty) {
              final file = result.files.first;

              controller.selectedDocument.value = File(file.path!);
              controller.selectedDocumentName.value = file.name;

              print("[DocumentStep] -> Documento selecionado: ${file.name}");
            }
          },
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: DesignSystemColors.lightgrey),
            ),
            child: Center(
              child: Obx(() {
                final docName = controller.selectedDocumentName.value;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload_file,
                      size: 48,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      docName ?? "Clique para enviar documento do produto",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 16,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),

        const SizedBox(height: 16),

        Obx(() {
          if (controller.selectedDocument.value != null) {
            return Text(
              "Arquivo selecionado:\n${controller.selectedDocumentName.value}",
              style: const TextStyle(color: Colors.white70),
            );
          }
          return const SizedBox.shrink();
        }),
      ],
    );
  }
}
