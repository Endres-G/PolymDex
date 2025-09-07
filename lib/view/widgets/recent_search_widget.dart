import 'package:flutter/material.dart';
import 'package:polymdex/core/themes/design_system.dart';

class RecentSearchWidget extends StatelessWidget {
  const RecentSearchWidget({super.key, required this.productName});
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 121,
      height: 38,
      decoration: BoxDecoration(
        color: DesignSystemColors.grey,
        border: Border.all(color: DesignSystemColors.lightgrey),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(child: Text(productName, style: TextStyle(fontSize: 12))),
    );
  }
}
