import 'package:e_pkk_nganjuk/_core/component/button/card_button_actions.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/card_pengumuman.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/widget_carousel_banner.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/widget_text_pengumuman.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../services/preferences/preferences_service.dart';
import '../components/header_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String role;
  String? roleBidang;
  String? fullName = "User";

  @override
  void initState() {
    super.initState();
    // role = Get.arguments['role'] ?? 'Tidak diketahui';
    // print('Role Home: $role');
    loadUserData();
  }

  Future<void> loadUserData() async {
    final user = await PreferencesService.getUser();
    if (user != null) {
      setState(() {
        fullName = user.fullName;
        roleBidang = user.organization?.name;
      });
      print('Name User Home : $fullName');
      print('Role Bidang Home: $roleBidang');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderHome(
              textUser: fullName ?? 'User',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      WidgetCarouselBanner(),
                      SizedBox(height: 32.h),
                      CardButtonActions(
                        backroundColor: ButtonActionsColors.fillLaporan,
                        strokeColor: ButtonActionsColors.strokeLaporan,
                        titleText: 'Upload Laporan',
                        subTitle: 'upload laporan PKK disini',
                        imageAssets: 'assets/images/ic_report.png',
                        onTab: () {
                          // Get.toNamed(Routes.UPLOAD_LAPORAN, arguments: {
                          //   'role': role,
                          //   'role_bidang': roleBidang,
                          // });
                        },
                      ),
                      SizedBox(height: 14.h),
                      CardButtonActions(
                        backroundColor: ButtonActionsColors.fillGalery,
                        strokeColor: ButtonActionsColors.strokeGalery,
                        titleText: 'Upload Galeri',
                        subTitle: 'upload galeri kegiatan PKK disini',
                        imageAssets: 'assets/images/ic_gallery.png',
                        onTab: () {},
                      ),
                      SizedBox(height: 32.h),
                      WidgetTextPengumuman(
                        firstText: 'Pengumuman',
                        secondText: 'Daftar pengumuman dari pusat',
                        threeText: 'Lihat semua',
                        svgIcon: 'assets/icons/ic_arrow_right.svg',
                      ),
                      SizedBox(height: 16.h),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: CardPengumuman(
                              title: 'Kegiatan PKK di desa Bagor dal...',
                              subTitle: 'upload galeri kegiatan PKK',
                              dateText: '07-10-2024',
                              onTab: () {},
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
