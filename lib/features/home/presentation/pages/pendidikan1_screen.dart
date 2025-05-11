import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/pendidikan_keterampilan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class Pendidikan1Screen extends StatefulWidget {
  const Pendidikan1Screen({super.key});

  @override
  State<Pendidikan1Screen> createState() => _Pendidikan1ScreenState();
}

class _Pendidikan1ScreenState extends State<Pendidikan1Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  final jumlahButaController = TextEditingController();
  final kelBelajarAController = TextEditingController();
  final wargaBelajarAController = TextEditingController();
  final kelBelajarBController = TextEditingController();
  final wargaBelajarBController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PendidikanKeterampilanController uploadController = Get.find<PendidikanKeterampilanController>();

  void clearForm() {
    jumlahButaController.clear();
    kelBelajarAController.clear();
    wargaBelajarAController.clear();
    kelBelajarBController.clear();
    wargaBelajarBController.clear();
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

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Pendidikan & Ketrampilan',
        currentStep: 1,
        totalSteps: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionBold(
                    'Jumlah Kelompok Belajar',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahButaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah warga yang masih buta',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionBold(
                    'Paket A',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: kelBelajarAController,
                  hintText: 'Masukkan jumlah',
                  label: 'Kel. Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: wargaBelajarAController,
                  hintText: 'Masukkan jumlah',
                  label: 'Warga Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionBold(
                    'Paket B',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: kelBelajarBController,
                  hintText: 'Masukkan jumlah',
                  label: 'Kel. Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: wargaBelajarBController,
                  hintText: 'Masukkan jumlah',
                  label: 'Warga Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
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
                
                Get.toNamed(Routes.PENDIDIKAN2, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'warga_buta': jumlahButaController.text,
                'kel_belajarA': kelBelajarAController.text,
                'warga_belajarA': wargaBelajarAController.text,
                'kel_belajarB': kelBelajarBController.text,
                'warga_belajarB': wargaBelajarBController.text
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


