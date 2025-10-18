import 'package:flutter/material.dart';
import 'package:polymdex/core/themes/design_system.dart';

class DataContainerWidget extends StatefulWidget {
  const DataContainerWidget({super.key});

  @override
  State<DataContainerWidget> createState() => _DataContainerWidgetState();
}

class _DataContainerWidgetState extends State<DataContainerWidget> {
  // NEW: State variable to control the expansion
  bool _isExpanded = false;

  // NEW: Helper method to build the text with a label and value
  Widget _buildInfoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            height: 1.3,
            fontFamily: 'your_font_family', // Ensure you use the same font
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
    return GestureDetector(
      // NEW: Tapping the container will toggle the expanded state
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
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
            // This part remains the same
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Poliestireno',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'ID: 58158',
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // The initial information
            _buildInfoText('Densidade', '1,05 g/cm³'),
            _buildInfoText('MFI', '25 g/10 min'),

            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: _buildExpandedContent(),
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

  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        _buildInfoText('Aplicação', 'sacola, roupa'),
        _buildInfoText('Família', '1,05 g/cm³'),
        _buildInfoText('Tipo de polimero', 'Tipo A'),
        _buildInfoText('Tecnologia', '1'),
        _buildInfoText('Aditivo', 'sem'),
        const SizedBox(height: 16),
        // The "Open Document" button
        Align(
          alignment: AlignmentGeometry.bottomLeft,
          child: Container(
            decoration: BoxDecoration(
              color: DesignSystemColors.grey.withOpacity(0.8),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Colors.white24, // mesma cor da borda do container
                width: 1,
              ),
            ),
            child: TextButton(
              onPressed: () {
                print('Abrir Documento tapped!');
              },
              style: TextButton.styleFrom(
                backgroundColor:
                    Colors.transparent, // deixa o container definir a cor
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
