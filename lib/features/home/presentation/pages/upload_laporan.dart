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
    final role = Get.arguments['role'] ?? 'Not Found';
    final roleBidang = Get.arguments['role_bidang'] ?? 'Not Found';
    print('Role Upload Laporan: $role + $roleBidang');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomeAppBar(
        title: 'Upload Laporan',
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
                        'role': role,
                        'role_bidang': roleBidang,
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
                    onTab: () {},
                    imageAssets: 'assets/images/ic_garuda.png',
                  ),
                  SizedBox(height: 16.h),
                  CardButtonActions(
                    backroundColor: Color(0xFFFFEED5),
                    strokeColor: Color(0xFFFFFDAAA),
                    titleText: 'Gotong Royong',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {},
                    imageAssets: 'assets/images/ic_gotong_royong.png',
                  ),
                ] else if (roleBidang == 'Kader Pokja II') ...[
                  CardButtonActions(
                    backroundColor: Color(0xFFFFF4C6),
                    strokeColor: Color(0xFFFFE990),
                    titleText: 'Kader Pokja 2',
                    subTitle: 'Klik untuk melanjutkan',
                    onTab: () {},
                    imageAssets: 'assets/images/ic_garuda.png',
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
