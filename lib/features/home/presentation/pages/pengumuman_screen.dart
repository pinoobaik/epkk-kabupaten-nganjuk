import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/card_pengumuman.dart';
import 'package:e_pkk_nganjuk/get/controller/nav_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pengumuman_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class PengumumanScreen extends StatelessWidget {
  PengumumanScreen({super.key});
  
  final PengumumanController pengumumanController = Get.find<PengumumanController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPrimary(
        title: 'Pengumuman',
        backgroundColor: Colors.white,
        onBack: () {
          final NavController navController = Get.find<NavController>();
          navController.changeTabIndex(0); // ganti ke tab "Beranda" (index ke-0)
          Get.back(); // kembali ke MainScreen
        },
      ),
      
      
      body: Obx(() {
        const Divider(height: 1);
        if (pengumumanController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (pengumumanController.errorMessage.isNotEmpty) {
          return Center(child: Text(pengumumanController.errorMessage.value));
        }

        if (pengumumanController.pengumumanList.isEmpty) {
          return const Center(child: Text("Belum ada pengumuman."));
        }
        
        return ListView.builder(
          padding: EdgeInsets.only(top: 16.h),
          itemCount: pengumumanController.pengumumanList.length,
          itemBuilder: (context, index) {
          final pengumuman = pengumumanController.pengumumanList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: CardPengumuman(
                title: pengumuman.judul,
                subTitle: pengumuman.tempat,
                dateText: DateFormat('dd-MM-yyyy').format(pengumuman.tanggal),
                onTab: () {},
              ),
            );
          },
        );
      }),
    );
  }
}
