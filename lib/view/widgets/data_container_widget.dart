import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/core/db/product_model.dart';

class DataContainerWidget extends StatefulWidget {
  final ProductModel product;

  const DataContainerWidget({super.key, required this.product});

  @override
  State<DataContainerWidget> createState() => _DataContainerWidgetState();
}

class _DataContainerWidgetState extends State<DataContainerWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: DesignSystemColors.grey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: DesignSystemColors.lightgrey, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 CARD FECHADO — TUDO EM UMA ÚNICA ROW
            if (!_isExpanded)
              Row(
                children: [
                  _cell(product.grade, width: 110, bold: true),
                  _cell(product.mi.toStringAsFixed(2), width: 70),
                  _cell(product.density.toStringAsFixed(3), width: 70),
                  _cell(product.comonomer ?? "-", width: 60),
                  Expanded(
                    child: Text(
                      product.additives?.join("/") ?? "-",
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),

            // 🔹 EXPANDIDO — MOSTRA DETALHES COMPLETOS
            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: _buildExpanded(product),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 250),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cell(String text, {double width = 70, bool bold = false}) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildExpanded(ProductModel product) {
    final controller = Get.find<HomeController>();

    Widget info(String title, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: Colors.white70, fontSize: 14),
            children: [
              TextSpan(
                text: "$title: ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: value),
            ],
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 14),
        info("Comonomer", product.comonomer ?? "-"),
        info(
          "Comonomer Content",
          product.comonomerContent?.toStringAsFixed(3) ?? "-",
        ),
        info("MWD", product.mwd ?? "-"),
        info("Processing Aid", product.processingAid == true ? "Sim" : "Não"),
        info("Antiblock", product.antiblock == true ? "Sim" : "Não"),
        info("Additives", product.additives?.join(", ") ?? "-"),

        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            decoration: BoxDecoration(
              color: DesignSystemColors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24),
            ),
            child: TextButton(
              onPressed: () {
                print(product.id);
                controller.openProductDocument(product.id);
              },
              child: const Text(
                "Abrir Documento",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
