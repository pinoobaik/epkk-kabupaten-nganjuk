import 'dart:async';
import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/card_laporan.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/riwayat_button.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/pages/detail_laporan_screen.dart';
import 'package:e_pkk_nganjuk/get/controller/nav_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/riwayat_controller.dart';
import 'package:e_pkk_nganjuk/services/preferences/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  final RiwayatController riwayatController = Get.find<RiwayatController>();
  
  String selectedStatus = 'Proses';

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final user = await PreferencesService.getUser();
    final idUser = user?.id?? 'id user tidak diketahui';
    final idRole = user?.role?.id?? 'id role tidak diketahui';
    final idOrganization = user?.organization?.id?? 'id organization tidak diketahui';

      print('id_user: $idUser');
      print('id_role: $idRole');
      print('id_organization: $idOrganization');

    await riwayatController.loadRiwayat(
      idUser: idUser,
      idRole: idRole,
      idOrganization: idOrganization,
    );
  }

  String _getStatusLabel(String status) {
    switch (status) {
      case 'Proses':
        return 'Sedang Diproses';
      case 'Disetujui1':
        return 'Disetujui Kecamatan';
      case 'Disetujui2':
        return 'Disetujui Kabupaten';
      case 'Dibatalkan':
        return 'Dibatalkan';
      default:
        return status; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPrimary(
        title: 'Riwayat',
        backgroundColor: Colors.white,
        onBack: () {
          final NavController navController = Get.find<NavController>();
          navController.changeTabIndex(0);
          Get.back();
        },
      ),
      body: Column(
        children: [
          
          StatusFilterCard(
            selectedStatus: selectedStatus,
            onStatusSelected: (status) {
              setState(() {
                selectedStatus = status;
              });
            },
          ),
          Expanded(
            child: Obx(() {
              if (riwayatController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (riwayatController.errorMessage.isNotEmpty) {
                return Center(child: Text(riwayatController.errorMessage.value));
              }

              final filteredList = riwayatController.riwayatList
                  .where((r) {
                    if (selectedStatus == 'Selesai') {
                      return r.status == 'Disetujui1' || r.status == 'Disetujui2' || r.status == 'Dibatalkan';
                    }
                    return r.status == selectedStatus;
                  })
                  .toList();

              if (filteredList.isEmpty) {
                return const Center(child: Text("Tidak ada laporan dengan status ini."));
              }

              return ListView.builder(
                padding: EdgeInsets.only(top: 16.h),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final riwayat = filteredList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: CardLaporan(
                      title: riwayat.uuid,
                      subtitle: getSubtitleFromUUID(riwayat.uuid),
                      status: _getStatusLabel(riwayat.status),
                      dateText: DateFormat('dd-MM-yyyy').format(riwayat.createdAt),
                      onTap: () {
                        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailLaporanScreen(
                              uuid: riwayat.uuid,
                              title: riwayat.uuid,
                              subtitle: getSubtitleFromUUID(riwayat.uuid),
                              status: riwayat.status,
                              createdAt: riwayat.createdAt,
                              idOrganization: riwayat.idOrganization, // Ganti dengan nilai yang sesuai
                            ),
                          ),
                        );
                      }
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
  String _getJenisLaporanFromUUID(String uuid) {
  return uuid.split('-').first;}
}
