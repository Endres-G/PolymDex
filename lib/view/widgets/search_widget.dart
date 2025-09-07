import 'package:flutter/material.dart';
import 'package:polymdex/core/themes/design_system.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 55,
      decoration: BoxDecoration(
        color: DesignSystemColors.grey,
        border: Border.all(color: DesignSystemColors.lightgrey),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.dehaze_sharp),
            Text("Pesquedise no PolymDex          "),
            Icon(Icons.search),
          ],
        ),
      ),
    );
  }
}
