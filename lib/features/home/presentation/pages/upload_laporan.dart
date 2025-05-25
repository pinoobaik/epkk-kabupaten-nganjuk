import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/card_button_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/app_routes.dart';

class UploadLaporan extends StatelessWidget {
  const UploadLaporan({super.key});

  @override
  Widget build(BuildContext context) {
    final id_user = Get.arguments['id_user'] ?? 'Not Found';
    final full_name = Get.arguments['full_name'] ?? 'Not Found';
    final id_role = Get.arguments['id_role'] ?? 'Not Found';
    final role = Get.arguments['name_role'] ?? 'Not Found';
    final id_organization = Get.arguments['id_organization'] ?? 'Not Found';
    final roleBidang = Get.arguments['name_organization'] ?? 'Not Found';
    print('Role Upload Laporan: $role + $roleBidang');
    print('id_user: $id_user');
    print('fullName: $full_name');
    print('id_role: $id_role');
    print('id_organization: $id_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPrimary(
        title: 'Upload Laporan',
        onBack: () => Get.back(),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/upload_laporan.png'),
                SizedBox(height: 32.h),
                if (roleBidang == 'Kader Pokja I') ...[
                  CardButtonActions(
                    backroundColor: Color(0xFFFFD8C8),
                    strokeColor: Color(0xFFFFC9B2),
                    titleText: 'Kader Pokja 1',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.KADER_POKJA1, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_organisasi.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFF4C6),
                    strokeColor: Color(0xFFFFE990),
                    titleText: 'Penghayatan & Pengamalan Pancasila',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.PENGHAYATAN, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                        // 'role': role,
                        // 'role_bidang': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_garuda.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFEED5),
                    strokeColor: Color(0xFFFFFDAAA),
                    titleText: 'Gotong Royong',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.GOTONG_ROYONG, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                        // 'role': role,
                        // 'role_bidang': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_gotong_royong.png',
                  ),
                ] else if (roleBidang == 'Kader Pokja II') ...[
                  // CardButtonActions(
                  //   backroundColor: Color(0xFFFFF4C6),
                  //   strokeColor: Color(0xFFFFE990),
                  //   titleText: 'Kader Pokja 2',
                  //   subTitle: 'Klik untuk melanjutkan',
                  //   onTab: () {},
                  //   imageAssets: 'assets/images/ic_organisasi.png',
                  // ),
                  // SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFF4C6),
                    strokeColor: Color(0xFFFFE990),
                    titleText: 'Pendidikan Ketrampilan',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.PENDIDIKAN1, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                        // 'role': role,
                        // 'role_bidang': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_pendidikan_keterampilan.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFEED5),
                    strokeColor: Color(0xFFFFFDAAA),
                    titleText: 'Pengembangan Kehidupan Berkoperasi',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.PENGEMBANGAN1, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                        // 'role': role,
                        // 'role_bidang': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_pengembangan_kehidupan_berkoperasi.png',
                  ),
                ] else if (roleBidang == 'Kader Pokja III') ...[
                  CardButtonActions(
                    backroundColor: Color(0xFFFFF4C6),
                    strokeColor: Color(0xFFFFE990),
                    titleText: 'Kader Pokja III',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.KADER_POKJA3, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_organisasi.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFF4C6),
                    strokeColor: Color(0xFFFFE990),
                    titleText: 'Pangan',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.PANGAN1, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_garuda.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFEED5),
                    strokeColor: Color(0xFFFFFDAAA),
                    titleText: 'Sandang',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.SANDANG, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_gotong_royong.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFEED5),
                    strokeColor: Color(0xFFFFFDAAA),
                    titleText: 'Perumahan & Tata Laksana Rumah Tangga',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.PERUMAHAN, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_gotong_royong.png',
                  ),
                ] else if (roleBidang == 'Kader Pokja IV') ...[
                  CardButtonActions(
                    backroundColor: Color(0xFFFFF4C6),
                    strokeColor: Color(0xFFFFE990),
                    titleText: 'Kader Pokja IV',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.KADER_POKJA4, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_organisasi.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFF4C6),
                    strokeColor: Color(0xFFFFE990),
                    titleText: 'Kesehatan',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.KESEHATAN, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_garuda.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFEED5),
                    strokeColor: Color(0xFFFFFDAAA),
                    titleText: 'Kelestarian Lingkungan Hidup',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.KELESTARIAN1, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_gotong_royong.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFEED5),
                    strokeColor: Color(0xFFFFFDAAA),
                    titleText: 'Perencanaan Sehat',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {
                      Get.toNamed(Routes.PERENCANAAN, arguments: {
                        'id_user': id_user,
                        'full_name': full_name,
                        'id_role': id_role,
                        'name_role': role,
                        'id_organization': id_organization,
                        'name_organization': roleBidang,
                      });
                    },
                    imageAssets: 'assets/images/ic_gotong_royong.png',
                  ),
                ] 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
