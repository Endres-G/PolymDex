import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polymdex/controllers/home_controller.dart';
import 'package:polymdex/core/routes/app_routes.dart';
import 'package:polymdex/core/services/navigation_service.dart';
import 'package:polymdex/core/themes/design_system.dart';
import 'package:polymdex/view/widgets/recent_search_widget.dart';
import 'package:polymdex/view/widgets/search_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            "Confirmar saída",
            style: TextStyle(color: Colors.white),
          ),
          content: const Text(
            "Tem certeza que deseja sair da sua conta?",
            style: TextStyle(color: Colors.white70),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                "Cancelar",
                style: TextStyle(color: Colors.white),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                controller.sair();
              },
              child: const Text("Sair", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const SizedBox(), // ← agora vazio
        actions: [
          IconButton(
            onPressed: () => _confirmLogout(context),
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: "Sair",
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 👋 Saudação dentro do padding
              Obx(() {
                if (controller.isLoading.value) {
                  return const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  );
                } else {
                  return Text(
                    "Olá, ${controller.userName.value}!",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  );
                }
              }),

              const SizedBox(height: 20),

              // 🔍 Barra de busca
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    NavigationService.pageToNamed(
                      AppRoutes.search,
                      arguments: {'showSearchBar': true},
                    );
                  },
                  child: const SearchWidget(isInHome: true),
                ),
              ),

              const SizedBox(height: 31),

              const Text(
                "Buscas Rápidas",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 8),

              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.searchByPolymer('PP'),
                    child: const RecentSearchWidget(productName: "PP"),
                  ),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: () => controller.searchByPolymer('PE'),
                    child: const RecentSearchWidget(productName: "PE"),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              const Text(
                "O que está buscando?",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 12),

              GestureDetector(
                onTap: () {
                  NavigationService.pageToNamed(AppRoutes.createProduct);
                },
                child: const _HomeCard(
                  icon: Icons.file_upload_outlined,
                  text: "Carregar Novo Produto",
                ),
              ),

              const SizedBox(height: 14),

              GestureDetector(
                onTap: () {
                  NavigationService.pageToNamed(AppRoutes.filters);
                },
                child: const _HomeCard(
                  icon: Icons.filter_alt_outlined,
                  text: "Pesquisa avançada",
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const _HomeCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 334,
      height: 178,
      decoration: BoxDecoration(
        color: DesignSystemColors.grey,
        border: Border.all(color: DesignSystemColors.lightgrey),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 60, color: Colors.white),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
