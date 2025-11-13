import 'package:flutter/material.dart';
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

  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            height: 1.3,
            fontFamily: 'your_font_family',
          ),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  product.grade,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'ID: ${product.id}',
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildInfoText('Densidade', product.density.toStringAsFixed(3)),
            _buildInfoText('MFI', product.mi.toStringAsFixed(2)),

            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: _buildExpandedContent(product),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 150),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandedContent(ProductModel product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        _buildInfoText('Comonomer', product.comonomer ?? '-'),
        _buildInfoText(
          'Comonomer Content',
          product.comonomerContent?.toStringAsFixed(3) ?? '-',
        ),
        _buildInfoText('MWD', product.mwd ?? '-'),
        _buildInfoText(
          'Processing Aid',
          product.processingAid == true ? 'Sim' : 'Não',
        ),
        _buildInfoText('Antiblock', product.antiblock == true ? 'Sim' : 'Não'),
        _buildInfoText('Additives', product.additives?.join(', ') ?? '-'),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
              color: DesignSystemColors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: TextButton(
              onPressed: () {
                print('Abrir Documento tapped!');
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Abrir Documento',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
