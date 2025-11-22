import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/themes/design_system.dart';

class SearchWidget extends StatefulWidget {
  final bool isInHome;

  const SearchWidget({super.key, required this.isInHome});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    // Quando não for a Home, já dá foco automaticamente
    if (!widget.isInHome) {
      // Aguarda o frame pra evitar erro de contexto
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _focusNode.requestFocus();
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return GestureDetector(
      onTap: widget.isInHome
          ? () {
              Get.toNamed(AppRoutes.search, arguments: {'showSearchBar': true});
            }
          : null,
      child: Container(
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
            children: [
              const Icon(Icons.dehaze_sharp, color: Colors.white70),
              const SizedBox(width: 12),

              widget.isInHome
                  ? const Expanded(
                      child: Text(
                        'Pesquise no PolymDex...',
                        style: TextStyle(color: Colors.white54, fontSize: 16),
                      ),
                    )
                  : Expanded(
                      child: TextField(
                        focusNode: _focusNode, // 🔥 AUTOFOCUS
                        style: const TextStyle(color: Colors.white),
                        cursorColor: Colors.white70,
                        decoration: const InputDecoration(
                          hintText: 'Pesquise no PolymDex...',
                          hintStyle: TextStyle(color: Colors.white54),
                          border: InputBorder.none,
                          isDense: true,
                        ),
                        onChanged: (value) {
                          controller.searchByGrade(value);
                        },
                      ),
                    ),

              const Icon(Icons.search, color: Colors.white70),
            ],
          ),
        ),
      ),
    );
  }
}
