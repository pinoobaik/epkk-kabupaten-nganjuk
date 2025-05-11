import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/pendidikan_keterampilan_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pengembangan_kehidupan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class Pengembangan2 extends StatefulWidget {
  const Pengembangan2({super.key});

  @override
  State<Pengembangan2> createState() => _Pengembangan1ScreenState();
}

class _Pengembangan1ScreenState extends State<Pengembangan2> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;
  String? jumlah_kelompok_pemula;
  String? jumlah_peserta_pemula;
  String? jumlah_kelompok_madya;
  String? jumlah_peserta_madya;
  String? jumlah_kelompok_utama;
  String? jumlah_peserta_utama;
  String? jumlah_kelompok_mandiri;
  String? jumlah_peserta_mandiri;

  final koperasiKelompokController = TextEditingController();
  final koperasiPesertaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PengembanganKehidupanController uploadController = Get.find<PengembanganKehidupanController>();

  void clearForm() {
    koperasiPesertaController.clear();
    koperasiPesertaController.clear();
  }

  @override
  void initState() {
    super.initState();
    //loadUserData();
    final args = Get.arguments;
    id_user = args['id_user'];
    full_name = args['full_name'];
    id_role = args['id_role'];
    name_role = args['name_role'];
    id_organization = args['id_organization'];
    name_organization = args['name_organization'];
    jumlah_kelompok_pemula = args['jumlah_kelompok_pemula'];
    jumlah_peserta_pemula = args['jumlah_peserta_pemula'];
    jumlah_kelompok_madya = args['jumlah_kelompok_madya'];
    jumlah_peserta_madya = args['jumlah_peserta_madya'];
    jumlah_kelompok_utama = args['jumlah_kelompok_utama'];
    jumlah_peserta_utama = args['jumlah_peserta_utama'];
    jumlah_kelompok_mandiri = args['jumlah_kelompok_mandiri'];
    jumlah_peserta_mandiri = args['jumlah_peserta_mandiri'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Pengembangan Kehidupan Berkoperasi',
        currentStep: 2,
        totalSteps: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Bar
                // Row(
                //   children: List.generate(3, (index) {
                //     return Expanded(
                //       child: Container(
                //         height: 4.h,
                //         margin: EdgeInsets.only(right: index < 2 ? 4.w : 0),
                //         decoration: BoxDecoration(
                //           color: index == 0 ? Colors.blue : Colors.grey[300],
                //           borderRadius: BorderRadius.circular(4.r),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                SizedBox(height: 32.h),
                TypographyStyles.bodyCaptionSemiBold(
                  'Koperasi Berbadan Hukum',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 24.h),

                // Permula
                // TypographyStyles.bodyCaptionSemiBold('Permula',
                //     color: TextColors.grey900),
                // SizedBox(height: 12.h),
                InputFormField(
                  controller: koperasiKelompokController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kelompok',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: koperasiPesertaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Peserta',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 28.h),

                // Madya
                // TypographyStyles.bodyCaptionSemiBold('Madya',
                //     color: TextColors.grey900),
                // SizedBox(height: 12.h),
                // InputFormField(
                //   controller: madyaKelompokController,
                //   hintText: 'Masukkan jumlah',
                //   label: 'Jumlah Kelompok',
                //   validator: (value) => ValidatorForm.validateDefault(value),
                // ),
                // SizedBox(height: 20.h),
                // InputFormField(
                //   controller: madyaPesertaController,
                //   hintText: 'Masukkan jumlah',
                //   label: 'Jumlah Peserta',
                //   validator: (value) => ValidatorForm.validateDefault(value),
                // ),
                // SizedBox(height: 28.h),

                // // Utama
                // TypographyStyles.bodyCaptionSemiBold('Utama',
                //     color: TextColors.grey900),
                // SizedBox(height: 12.h),
                // InputFormField(
                //   controller: utamaKelompokController,
                //   hintText: 'Masukkan jumlah',
                //   label: 'Jumlah Kelompok',
                //   validator: (value) => ValidatorForm.validateDefault(value),
                // ),
                // SizedBox(height: 20.h),
                // InputFormField(
                //   controller: utamaPesertaController,
                //   hintText: 'Masukkan jumlah',
                //   label: 'Jumlah Peserta',
                //   validator: (value) => ValidatorForm.validateDefault(value),
                // ),
                // SizedBox(height: 28.h),

                // // Mandiri
                // TypographyStyles.bodyCaptionSemiBold('Mandiri',
                //     color: TextColors.grey900),
                // SizedBox(height: 12.h),
                // InputFormField(
                //   controller: mandiriKelompokController,
                //   hintText: 'Masukkan jumlah',
                //   label: 'Jumlah Kelompok',
                //   validator: (value) => ValidatorForm.validateDefault(value),
                // ),
                // SizedBox(height: 20.h),
                // InputFormField(
                //   controller: mandiriPesertaController,
                //   hintText: 'Masukkan jumlah',
                //   label: 'Jumlah Peserta',
                //   validator: (value) => ValidatorForm.validateDefault(value),
                // ),
                // SizedBox(height: 28.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ZoomTapAnimation(
          child: Obx(
            () => ButtonFill(
            text: 'Lanjut',
            textColor: Colors.white,
            isLoading: uploadController.isLoading.value,
            onPressed: uploadController.isLoading.value
            ? null
            : () {

              if (_formKey.currentState!.validate()) {
                
                Get.toNamed(Routes.PENGEMBANGAN3, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'jumlah_kelompok_pemula': jumlah_kelompok_pemula,
                'jumlah_peserta_pemula': jumlah_peserta_pemula,
                'jumlah_kelompok_madya': jumlah_kelompok_madya,
                'jumlah_peserta_madya': jumlah_peserta_madya,
                'jumlah_kelompok_utama': jumlah_kelompok_utama,
                'jumlah_peserta_utama': jumlah_peserta_utama,
                'jumlah_kelompok_mandiri': jumlah_kelompok_mandiri,
                'jumlah_peserta_mandiri': jumlah_peserta_mandiri,
                'jumlah_kelompok_hukum': koperasiKelompokController.text,
                'jumlah_peserta_hukum': koperasiPesertaController.text,
                  }
                );
              } else {
                Get.snackbar(
                  'Error',
                  'Lengkapi Form',
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
              
              }
            ),
          ),
        ),
      ),
    );
  }
}


