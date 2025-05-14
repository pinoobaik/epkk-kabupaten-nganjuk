import 'package:e_pkk_nganjuk/features/home/presentation/pages/home_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/pengumuman_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/profil_screen.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/riwayat_screen.dart';
import 'package:e_pkk_nganjuk/get/controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MainScreen extends StatelessWidget {
  final NavController controller = Get.put(NavController());

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Map<String, dynamic> args = Get.arguments ?? {};
    // final String? role = args['role'];

    final List<Widget> pages = [
      HomeScreen(),
      RiwayatPage(),
      PengumumanScreen(),
      AkunPage(),
    ];

    return Obx(() => Scaffold(
          body: pages[controller.selectedIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            elevation: 8,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14, // ukuran teks aktif
            unselectedFontSize: 12,
            selectedIconTheme: IconThemeData(
              size: 30,
              color: Colors.blue, // warna ikon aktif
            ),
            unselectedIconTheme: IconThemeData(
              size: 22,
              color: Colors.grey, // warna ikon tidak aktif
            ), // ukuran teks non-aktif
            
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded),
                label: 'Beranda',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_rounded),
                label: 'Riwayat',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.campaign_rounded),
                label: 'Pengumuman',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_rounded),
                label: 'Akun',
              ),
            ],
          ),
        ));
  }
}
