import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/get/controller/kader_pokja3_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../services/preferences/preferences_service.dart';

class KaderPokja3Screen extends StatefulWidget {
  const KaderPokja3Screen({super.key});

  @override
  State<KaderPokja3Screen> createState() => _KaderPokja3ScreenState();
}

class _KaderPokja3ScreenState extends State<KaderPokja3Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  
  final panganController = TextEditingController();
  final sandangController = TextEditingController();
  final tataController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final KaderPokja3Controller uploadReportController = Get.find<KaderPokja3Controller>();

  // Future<void> loadUserData() async {
  //   final user = await PreferencesService.getUser();
  //   if (user != null) {
  //     setState(() {
  //       id_user = user.id;
  //     });
  //     print('Name User Home : $id_user');
  //   }
  // }

  void clearForm() {
    panganController.clear();
    sandangController.clear();
    tataController.clear();
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
    // final role = Get.arguments['role'] ?? 'Not Found';
    // final roleBidang = Get.arguments['role_bidang'] ?? 'Not Found';
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Kader Pokja III',
        currentStep: 1,
        totalSteps: 1,
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
                  controller: panganController,
                  hintText: 'Masukkan jumlah',
                  label: 'Pangan',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                    controller: sandangController,
                    hintText: 'Masukkan jumlah',
                    label: 'Sandang',
                    validator: (value) => ValidatorForm.validateDefault(value)),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: tataController,
                  hintText: 'Masukkan jumlah',
                  label: 'Tata Laksana Rumah Tangga',
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
                          await uploadReportController.submitKaderPokja3(
                            pangan: panganController.text,
                            sandang: sandangController.text,
                            tataLaksanaRumah: tataController.text,
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
        ),
      ),
    );
  }
}

// import 'dart:async';
// import 'dart:io';

// import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
// import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
// import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
// import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
// import 'package:e_pkk_nganjuk/get/controller/kader_pokja1_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// //import '../../../../services/preferences/preferences_service.dart';

// class KaderPokja1Screen extends StatefulWidget {
//   const KaderPokja1Screen({super.key});

//   @override
//   State<KaderPokja1Screen> createState() => _KaderPokja1ScreenState();
// }

// class _KaderPokja1ScreenState extends State<KaderPokja1Screen> {
//   String? id_user;
//   String? id_role;
//   String? id_organization;
//   String? full_name;
//   String? name_role;
//   String? name_organization;

//   final pkbnController = TextEditingController();
//   final pkdrtController = TextEditingController();
//   final polaController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   final UploadReportController uploadReportController = Get.find<UploadReportController>();

//   // Future<void> loadUserData() async {
//   //   final data = await PreferencesService.getUser();
//   //   if (data != null) {
//   //     setState(() {
//   //       id = data.id!;
//   //     });
//   //     print('Name User Home : $id');
//   //   }
//   // }

//   void clearForm() {
//     pkbnController.clear();
//     pkdrtController.clear();
//     polaController.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     //loadUserData();
//     final args = Get.arguments;
//     id_user = args['id_user'];
//     full_name = args['full_name'];
//     id_role = args['id_role'];
//     name_role = args['name_role'];
//     id_organization = args['id_organization'];
//     name_organization = args['name_organization'];

//     print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final id_role = Get.arguments['role'] ?? 'Not Found';
//     // final id_organization = Get.arguments['role_bidang'] ?? 'Not Found';
//     print('Role Upload Laporan: $name_role + $name_organization');

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBarSecondary(
//         title: 'Kader Pokja I',
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 SizedBox(height: 12.h),
//                 InputFormField(
//                   controller: pkbnController,
//                   hintText: 'Masukkan jumlah',
//                   label: 'PKBN',
//                   validator: (value) => ValidatorForm.validatePKBN(value),
//                 ),
//                 SizedBox(height: 24.h),
//                 InputFormField(
//                     controller: pkdrtController,
//                     hintText: 'Masukkan jumlah',
//                     label: 'PKDRT',
//                     validator: (value) => ValidatorForm.validatePKDRT(value)),
//                 SizedBox(height: 24.h),
//                 InputFormField(
//                   controller: polaController,
//                   hintText: 'Masukkan jumlah',
//                   label: 'Pola Asuh',
//                   validator: (value) => ValidatorForm.validatePolaA(value),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//         child: ZoomTapAnimation(
//           child: Obx(
//             () => ButtonFill(
//               text: uploadReportController.isCreateKaderPokja1.value
//                   ? 'Loading'
//                   : 'UPLOAD',
//               textColor: Colors.white,
//               onPressed: uploadReportController.isCreateKaderPokja1.value
//                   ? null
//                   : () async {
//                       final isFormValid = _formKey.currentState!.validate();

//                       if (isFormValid) {
//                         try {
//                           await uploadReportController.createKaderPokja1Controller(
//                             PKBN: pkbnController.text,
//                             PKDRT: pkdrtController.text,
//                             pola_asuh: polaController.text,
//                             id_role: id_role!,
//                             id_organization: id_organization!,
//                             id_user: id_user!,
//                           );

//                           // Hanya tampilkan snackbar berhasil jika kode respons adalah 200
//                           if (uploadReportController.reportKaderPokja1Model.value != null 
//                               &&
//                               uploadReportController.reportKaderPokja1Model.value!.statusCode == 200
//                               ) {
//                             Get.snackbar(
//                               'Berhasil',
//                               'Laporan berhasil diupload!',
//                               snackPosition: SnackPosition.TOP,
//                               backgroundColor: Colors.green,
//                               colorText: Colors.white,
//                             );
//                             _formKey.currentState?.reset();
//                             clearForm();
//                           } else {
//                             String errorMessage = uploadReportController
//                                     .errorMessage.value.isNotEmpty
//                                 ? uploadReportController.errorMessage.value
//                                 : 'Terjadi kesalahan, silakan coba lagi.';

//                             Get.snackbar(
//                               'Error',
//                               errorMessage,
//                               snackPosition: SnackPosition.TOP,
//                               backgroundColor: Colors.red,
//                               colorText: Colors.white,
//                             );
//                           }
//                         } on SocketException {
//                           Get.snackbar(
//                             'Error',
//                             'Tidak ada koneksi internet. Silakan periksa koneksi Anda.',
//                             snackPosition: SnackPosition.TOP,
//                             backgroundColor: Colors.red,
//                             colorText: Colors.white,
//                           );
//                         } on TimeoutException {
//                           Get.snackbar(
//                             'Error',
//                             'Server tidak merespons, coba lagi nanti.',
//                             snackPosition: SnackPosition.TOP,
//                             backgroundColor: Colors.red,
//                             colorText: Colors.white,
//                           );
//                         } catch (e) {
//                           Get.snackbar(
//                             'Error',
//                             'Terjadi kesalahan yang tidak diketahui.',
//                             snackPosition: SnackPosition.TOP,
//                             backgroundColor: Colors.red,
//                             colorText: Colors.white,
//                           );
//                         }
//                       } else {
//                         Get.snackbar(
//                           'Error',
//                           'Form tidak valid! Mohon periksa kembali input Anda.',
//                           snackPosition: SnackPosition.TOP,
//                           backgroundColor: Colors.orange,
//                           colorText: Colors.white,
//                         );
//                       }
//                     },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
