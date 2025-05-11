import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/penghayatan_pengamalan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PenghayatanPengamalanScreen extends StatefulWidget {
  const PenghayatanPengamalanScreen({super.key});

  @override 
  State<PenghayatanPengamalanScreen> createState() => _PenghayatanPengamalanScreenState();
}

class _PenghayatanPengamalanScreenState extends State<PenghayatanPengamalanScreen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  final jumlahkel1Controller = TextEditingController();
  final jumlahanggota1Controller = TextEditingController();
  final jumlahkel2Controller = TextEditingController();
  final jumlahanggota2Controller = TextEditingController();
  final jumlahkel3Controller = TextEditingController();
  final jumlahanggota3Controller = TextEditingController();
  final jumlahkel4Controller = TextEditingController();
  final jumlahanggota4Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PenghayatanPengamalanController penghayatanPengamalanController = Get.find<PenghayatanPengamalanController>();

  void clearForm() {
    jumlahkel1Controller.clear();
    jumlahanggota1Controller.clear();
    jumlahkel2Controller.clear();
    jumlahanggota2Controller.clear();
    jumlahkel3Controller.clear();
    jumlahanggota3Controller.clear();
    jumlahkel4Controller.clear();
    jumlahanggota4Controller.clear();
  }

  @override
  void initState() {
    super.initState();

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
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Penghayatan & Pengamalan Pancasila',
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
                  child: TypographyStyles.bodyCaptionMedium(
                    'Sosialisasi Pendidikan PKBN',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel1Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota1Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionMedium(
                    'PKDRT',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel2Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota2Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionMedium(
                    'Pola Asuh',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel3Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota3Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                TypographyStyles.bodyCaptionMedium(
                  'Lansia',
                  color: TextColors.grey700,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel4Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota4Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
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
              text: penghayatanPengamalanController.isLoading.value
              ? 'Loading'
              : 'UPLOAD',
              textColor: Colors.white,
              onPressed: penghayatanPengamalanController.isLoading.value
              ? null
              : () async {
                final isFormValid = _formKey.currentState!.validate();

                if (isFormValid) {
                  try {
                    await penghayatanPengamalanController.submitPenghayatanPengamalan(
                      idUser: id_user!, 
                      jumlahKelSimulasi1: jumlahkel1Controller.text, 
                      jumlahAnggota1: jumlahanggota1Controller.text, 
                      jumlahKelSimulasi2: jumlahkel2Controller.text, 
                      jumlahAnggota2: jumlahanggota2Controller.text, 
                      jumlahKelSimulasi3: jumlahkel3Controller.text, 
                      jumlahAnggota3: jumlahanggota3Controller.text, 
                      jumlahKelSimulasi4: jumlahkel4Controller.text, 
                      jumlahAnggota4: jumlahanggota4Controller.text, 
                      idRole: id_role!, 
                      idOrganization: id_organization!
                      );

                    if (penghayatanPengamalanController.reportData.value != null 
                        &&
                        penghayatanPengamalanController.reportData.value!.statusCode == 200
                        ) {
                      Get.snackbar(
                        'Berhasil',
                        'Laporan berhasil diupload!',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                      _formKey.currentState?.reset();
                      clearForm();
                    } else {
                      String errorMessage = penghayatanPengamalanController.errorMessage.value.isNotEmpty
                          ? penghayatanPengamalanController.errorMessage.value
                          : 'Terjadi kesalahan, silakan coba lagi.';

                      Get.snackbar(
                        'Error',
                        errorMessage,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } 
                  } on SocketException {
                    Get.snackbar(
                      'Error',
                      'Tidak ada koneksi internet. Silakan periksa koneksi Anda.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } on TimeoutException {
                    Get.snackbar(
                      'Error',
                      'Server tidak merespons, coba lagi nanti.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } catch (e) {
                    Get.snackbar(
                      'Error',
                      'Terjadi kesalahan yang tidak diketahui.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                } else {
                  Get.snackbar(
                    'Error',
                    'Form tidak valid! Mohon periksa kembali input Anda.',
                    snackPosition: SnackPosition.TOP,
                    backgroundColor: Colors.orange,
                    colorText: Colors.white,
                  );   
                }
              }, 
            )  
          ),
        ),
      ),
    );
  }
}

  
