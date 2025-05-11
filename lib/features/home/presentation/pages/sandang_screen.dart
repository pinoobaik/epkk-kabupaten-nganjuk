import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/get/controller/sandang_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class SandangScreen extends StatefulWidget {
  const SandangScreen({super.key});

  @override
  State<SandangScreen> createState() => _SandangScreenState();
}

class _SandangScreenState extends State<SandangScreen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  final panganController = TextEditingController();
  final sandangController = TextEditingController();
  final jasaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final SandangController uploadReportController = Get.find<SandangController>();

  void clearForm() {
    panganController.clear();
    sandangController.clear();
    jasaController.clear();
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
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Sandang',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                TypographyStyles.bodyCaptionSemiBold(
                  'Jumlah Industri Rumah Tangga',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: panganController,
                  hintText: 'Masukkan jumlah',
                  label: 'Pangan',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: sandangController,
                  hintText: 'Masukkan jumlah',
                  label: 'Sandang',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: jasaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jasa',
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
              text: uploadReportController.isLoading.value
                  ? 'Loading'
                  : 'UPLOAD',
              textColor: Colors.white,
              onPressed: uploadReportController.isLoading.value
                  ? null
                  : () async {
                      final isFormValid = _formKey.currentState!.validate();

                      if (isFormValid) {
                        try {
                          await uploadReportController.submitDataSandang(
                            pangan: panganController.text,
                            sandang: sandangController.text,
                            jasa: jasaController.text,
                            idRole: id_role!,
                            idOrganization: id_organization!,
                            idUser: id_user!,
                          );

                          // Hanya tampilkan snackbar berhasil jika kode respons adalah 1
                          if (uploadReportController
                                      .reportData.value !=
                                  null &&
                              uploadReportController
                                      .reportData.value!.statusCode ==
                                  200) {
                            // Get.snackbar(
                            //   'Berhasil',
                            //   'Laporan berhasil diupload!',
                            //   snackPosition: SnackPosition.TOP,
                            //   backgroundColor: Colors.green,
                            //   colorText: Colors.white,
                            // );
                            _formKey.currentState?.reset();
                            clearForm();
                          } else {
                            String errorMessage = uploadReportController
                                    .errorMessage.value.isNotEmpty
                                ? uploadReportController.errorMessage.value
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
            ),
          ),
        )
      ),
    );
  }
}