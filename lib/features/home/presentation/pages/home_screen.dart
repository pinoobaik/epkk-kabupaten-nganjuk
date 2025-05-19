import 'package:e_pkk_nganjuk/_core/component/button/card_button_actions.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/card_pengumuman.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/grid_button.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/widget_carousel_banner.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/widget_text_pengumuman.dart';
import 'package:e_pkk_nganjuk/get/controller/pengumuman_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../routes/app_routes.dart';
import '../../../../services/preferences/preferences_service.dart';
import '../components/header_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String id_user;
  String? id_role;
  late String role;
  String? id_organization;
  String? roleBidang;
  String? fullName = "User fullname tidak diketahui";

  final PengumumanController pengumumanController = Get.find<PengumumanController>();

  @override
  void initState() {
    super.initState();
    // role = Get.arguments['role'] ?? 'Tidak diketahui';
    // print('Role Home: $role');
    loadUserData().then((_){
      pengumumanController.loadPengumuman();
    });
  }

  Future<void> loadUserData() async {
    final user = await PreferencesService.getUser();
    if (user != null) {
      setState(() {
        id_user = user.id?? 'id user tidak diketahui';
        fullName = user.fullName;
        id_role = user.role?.id?? 'id role tidak diketahui';
        role = user.role?.name?? 'name role tidak diketahui';
        id_organization = user.organization?.id?? 'id organization tidak diketahui';
        roleBidang = user.organization?.name?? 'name organization tidak diketahui';
      });
      print('fullName : $fullName');
      print('id_role: $id_role');
      print('role: $role');
      print('id_organization: $id_organization');
      print('organization: $roleBidang');
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
              textUser: fullName ?? 'User fullname tidak diketahui',
            ),
            //if (id_role == "2") GridButtons(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      // if (id_role != null && id_role == "1") ...[
                      //   WidgetCarouselBanner(),
                      // ] else ...[
                      //   GridButtons(),
                      // ],
                      WidgetCarouselBanner(),
                      SizedBox(height: 32.h),
                      if (roleBidang == 'Laporan Umum') ...[
                        CardButtonActions(
                        backroundColor: ButtonActionsColors.fillLaporan,
                        strokeColor: ButtonActionsColors.strokeLaporan,
                        titleText: 'Upload Laporan Umum',
                        subTitle: 'upload laporan umum PKK disini',
                        imageAssets: 'assets/images/ic_report.png',
                        onTab: () {
                          Get.toNamed(Routes.LAPORAN_UMUM1, arguments: {
                            'id_user': id_user,
                            'full_name': fullName,
                            'id_role': id_role,
                            'name_role': role,
                            'id_organization': id_organization,
                            'name_organization': roleBidang,
                          });
                        },
                      ),
                      ] else ... [
                        CardButtonActions(
                        backroundColor: ButtonActionsColors.fillLaporan,
                        strokeColor: ButtonActionsColors.strokeLaporan,
                        titleText: 'Upload Laporan',
                        subTitle: 'upload laporan PKK disini',
                        imageAssets: 'assets/images/ic_report.png',
                        onTab: () {
                          Get.toNamed(Routes.UPLOAD_LAPORAN, arguments: {
                            'id_user': id_user,
                            'full_name': fullName,
                            'id_role': id_role,
                            'name_role': role,
                            'id_organization': id_organization,
                            'name_organization': roleBidang,
                          });
                        },
                      ),
                      ],
                      SizedBox(height: 14.h),
                      CardButtonActions(
                        backroundColor: ButtonActionsColors.fillGalery,
                        strokeColor: ButtonActionsColors.strokeGalery,
                        titleText: 'Upload Galeri',
                        subTitle: 'upload galeri kegiatan PKK disini',
                        imageAssets: 'assets/images/ic_gallery.png',
                        onTab: () {
                          Get.toNamed(Routes.UPLOAD_GALERI, arguments: {
                            'id_user': id_user,
                            'full_name': fullName,
                            'id_role': id_role,
                            'name_role': role,
                            'id_organization': id_organization,
                            'name_organization': roleBidang,
                          });
                        },
                      ),
                      SizedBox(height: 32.h),
                      Obx((){
                        if (pengumumanController.isLoading.value) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (pengumumanController.errorMessage.isNotEmpty) {
                          return Text(pengumumanController.errorMessage.value);
                        }

                        return Column(
                          children: [
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
                            itemCount: pengumumanController.pengumumanList.length,
                            itemBuilder: (context, index) {
                              final pengumuman = pengumumanController.pengumumanList[index];
                              return Padding(
                                padding: EdgeInsets.only(bottom: 16.h),
                                child: CardPengumuman(
                                  title: pengumuman.judul,
                                  subTitle: pengumuman.tempat,
                                  dateText: DateFormat('dd-MM-yyyy').format(pengumuman.tanggal),
                                  onTab: () {},
                                ),
                              );
                            },
                          ),
                          ],
                        );
                      })
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
