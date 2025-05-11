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

class LaporanUmum2Screen extends StatefulWidget {
  const LaporanUmum2Screen({super.key});

  @override
  State<LaporanUmum2Screen> createState() => _LaporanUmum2ScreenState();
}

class _LaporanUmum2ScreenState extends State<LaporanUmum2Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;
  String? dusun_lingkungan;
  String? PKK_RW;
  String? desa_wisma;
  String? KRT;
  String? KK;

  final lakilaki1Controller = TextEditingController();
  final perempuan1Controller = TextEditingController();
  final lakilaki2Controller = TextEditingController();
  final perempuan2Controller = TextEditingController();
  final lakilaki3Controller = TextEditingController();
  final perempuan3Controller = TextEditingController();
  final lakilaki4Controller = TextEditingController();
  final perempuan4Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LaporanUmumController uploadController = Get.find<LaporanUmumController>();

  void clearForm() {
    lakilaki1Controller.clear();
    perempuan1Controller.clear();
    lakilaki2Controller.clear();
    perempuan2Controller.clear();
    lakilaki3Controller.clear();
    perempuan3Controller.clear();
    lakilaki4Controller.clear();
    perempuan4Controller.clear();
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
    dusun_lingkungan = args['dusun_lingkungan']; 
    PKK_RW = args['PKK_RW']; 
    desa_wisma = args['desa_wisma'];
    KRT = args['KRT']; 
    KK = args['KK'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }



  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Laporan Umum',
        currentStep: 2,
        totalSteps: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
            children: [
              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionBold(
                  'Jumlah Jiwa',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 32.h),
              InputFormField(
                controller: lakilaki1Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan1Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),

              SizedBox(height: 48.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionBold(
                  'Jumlah Kader',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 32.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Anggota TP PKK',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 16),
              InputFormField(
                controller: lakilaki2Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan2Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),

              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Umum',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 16),
              InputFormField(
                controller: lakilaki3Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan3Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),

              SizedBox(height: 24.h),
              Container(
                alignment: Alignment.centerLeft,
                child: TypographyStyles.bodyCaptionSmallMedium(
                  'Khusus',
                  color: TextColors.grey700,
                ),
              ),
              SizedBox(height: 16),
              InputFormField(
                controller: lakilaki4Controller,
                hintText: 'Masukkan jumlah',
                label: 'Laki-laki',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: perempuan4Controller,
                hintText: 'Masukkan jumlah',
                label: 'Perempuan',
                  validator: (value) => ValidatorForm.validateDefault(value),
              ),
            ],
          ),
            )
          
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
                
                Get.toNamed(Routes.LAPORAN_UMUM3, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'dusun_lingkungan': dusun_lingkungan,
                'PKK_RW': PKK_RW,
                'desa_wisma': desa_wisma,
                'KRT': KRT,
                'KK': KK,
                'jiwa_laki': lakilaki1Controller.text,
                'jiwa_perempuan': perempuan1Controller.text,
                'anggota_laki': lakilaki2Controller.text,
                'anggota_perempuan': perempuan2Controller.text,
                'umum_laki': lakilaki3Controller.text,
                'umum_perempuan': perempuan3Controller.text,
                'khusus_laki': lakilaki4Controller.text,
                'khusus_perempuan': perempuan4Controller.text,
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
          //     Get.toNamed(Routes.LAPORAN_UMUM3, arguments: {
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

