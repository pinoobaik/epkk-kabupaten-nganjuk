import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/get/controller/upload_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../services/preferences/preferences_service.dart';

class KaderPokja1Screen extends StatefulWidget {
  const KaderPokja1Screen({super.key});

  @override
  State<KaderPokja1Screen> createState() => _KaderPokja1ScreenState();
}

class _KaderPokja1ScreenState extends State<KaderPokja1Screen> {
  String? id_user;
  final pkbnController = TextEditingController();
  final pkdrtController = TextEditingController();
  final polaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final UploadReportController uploadReportController =
      Get.find<UploadReportController>();

  Future<void> loadUserData() async {
    final user = await PreferencesService.getUser();
    if (user != null) {
      setState(() {
        id_user = user.id;
      });
      print('Name User Home : $id_user');
    }
  }

  void clearForm() {
    pkbnController.clear();
    pkdrtController.clear();
    polaController.clear();
  }

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    final role = Get.arguments['role'] ?? 'Not Found';
    final roleBidang = Get.arguments['role_bidang'] ?? 'Not Found';
    print('Role Kader Pokja I: $role + $roleBidang');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Kader Pokja I',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 12.h),
                InputFormField(
                  controller: pkbnController,
                  hintText: 'Masukkan jumlah',
                  label: 'PKBN',
                  validator: (value) => ValidatorForm.validatePKBN(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                    controller: pkdrtController,
                    hintText: 'Masukkan jumlah',
                    label: 'PKDRT',
                    validator: (value) => ValidatorForm.validatePKDRT(value)),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: polaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Pola Asuh',
                  validator: (value) => ValidatorForm.validatePolaA(value),
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
              text: uploadReportController.isCreateKaderPokja1.value
                  ? 'Loading'
                  : 'UPLOAD',
              textColor: Colors.white,
              onPressed: uploadReportController.isCreateKaderPokja1.value
                  ? null
                  : () async {
                      final isFormValid = _formKey.currentState!.validate();

                      if (isFormValid) {
                        try {
                          await uploadReportController
                              .createKaderPokja1Controller(
                            PKBN: pkbnController.text,
                            PKDRT: pkdrtController.text,
                            pola_asuh: polaController.text,
                            role: role,
                            role_bidang: roleBidang,
                            id_user: id_user!,
                          );

                          // Hanya tampilkan snackbar berhasil jika kode respons adalah 1
                          if (uploadReportController
                                      .reportKaderPokja1Model.value !=
                                  null &&
                              uploadReportController
                                      .reportKaderPokja1Model.value!.kode ==
                                  1) {
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
        ),
      ),
    );
  }
}
