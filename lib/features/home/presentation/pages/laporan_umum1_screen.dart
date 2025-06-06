import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/laporan_umum_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:get/get.dart';
import '../../../../routes/app_routes.dart';

class LaporanUmum1Screen extends StatefulWidget {
  const LaporanUmum1Screen({super.key});

  @override
  State<LaporanUmum1Screen> createState() => _LaporanUmum1ScreenState();
}

class _LaporanUmum1ScreenState extends State<LaporanUmum1Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  final dusunController = TextEditingController();
  final pkkrwController = TextEditingController();
  final desawismaController = TextEditingController();
  final krtController = TextEditingController();
  final kkController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LaporanUmumController uploadController = Get.find<LaporanUmumController>();

  void clearForm() {
    dusunController.clear();
    pkkrwController.clear();
    desawismaController.clear();
    krtController.clear();
    kkController.clear();
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
        title: 'Laporan Umum',
        currentStep: 1,
        totalSteps: 4,
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
                    'Jumlah Kelompok',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: dusunController,
                  hintText: 'Masukkan jumlah',
                label: 'Dusun/Lingkungan',
                validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: pkkrwController,
                  hintText: 'Masukkan jumlah',
                  label: 'PKK RW',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: desawismaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Desa Wisma',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 48.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionBold(
                    'Jumlah',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: krtController,
                  hintText: 'Masukkan jumlah',
                  label: 'KRT',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: kkController,
                  hintText: 'Masukkan jumlah',
                  label: 'KK',
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
                
                Get.toNamed(Routes.LAPORAN_UMUM2, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'dusun_lingkungan': dusunController.text,
                'PKK_RW': pkkrwController.text,
                'desa_wisma': desawismaController.text,
                'KRT': krtController.text,
                'KK': kkController.text,
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
          // child: ButtonFill(
          //   text: 'Lanjut',
          //   textColor: Colors.white,
          //   onPressed: () {
          //     Get.toNamed(Routes.LAPORAN_UMUM2, arguments: {
          //               // 'role': role,
          //               // 'role_bidang': roleBidang,
          //             });
          //   },
          // ),
        ),
      ),
    );
  }
}

