// import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
// import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
// import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
// import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
// //import 'package:e_pkk_nganjuk/get/controller/upload_report_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// import '../../../../services/preferences/preferences_service.dart';

// class GotongRoyongScreen extends StatefulWidget{
//   const GotongRoyongScreen({super.key});

//   @override
//   State<GotongRoyongScreen> createState() => _GotongRoyongScreenState();
// }

// class _GotongRoyongScreenState extends State<GotongRoyongScreen> {
//   String? id_user;
//   final kerjabaktiController = TextEditingController();
//   final rukunkematianController = TextEditingController();
//   final keagamaanController = TextEditingController();
//   final jimpitanController = TextEditingController();
//   final arisanController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   //deklarasi controller disini

//   Future<void> loadUserData() async {
//     final user = await PreferencesService.getUser();
//     if (user != null) {
//       setState(() {
//         id_user = user.id;
//       });
//       print('Name User Home : $id_user');
//     }
//   }

//   //clearform disini
//   void clearForm() {
//      kerjabaktiController.clear();
//      rukunkematianController.clear();
//      keagamaanController.clear();
//      jimpitanController.clear();
//      arisanController.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     loadUserData();
//   }

//   //tampilan
//   @override
//   Widget build(BuildContext context) {
//     final role = Get.arguments['role'] ?? 'Not Found';
//     final roleBidang = Get.arguments['role_bidang'] ?? 'Not Found';
//     print('Role Kader Pokja I: $role + $roleBidang');

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBarSecondary(
//         title: 'Gotong Royong',
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
//                   controller: kerjabaktiController,
//                   hintText: 'Masukkan jumlah',
//                   label: 'Kerja Bakti',
//                   validator: (value) => ValidatorForm.validatePKBN(value),
//                 ),
//                 SizedBox(height: 24.h),
//                 InputFormField(
//                     controller: rukunkematianController,
//                     hintText: 'Masukkan jumlah',
//                     label: 'Rukun Kematian',
//                     validator: (value) => ValidatorForm.validatePKDRT(value)),
//                 SizedBox(height: 24.h),
//                 InputFormField(
//                   controller: keagamaanController,
//                   hintText: 'Masukkan jumlah',
//                   label: 'Keagamaan',
//                   validator: (value) => ValidatorForm.validatePolaA(value),
//                 ),
//                 SizedBox(height: 24.h),
//                 InputFormField(
//                   controller: jimpitanController,
//                   hintText: 'Masukkan jumlah',
//                   label: 'Jimpitan',
//                   validator: (value) => ValidatorForm.validatePolaA(value),
//                 ),
//                 SizedBox(height: 24.h),
//                 InputFormField(
//                   controller: arisanController,
//                   hintText: 'Masukkan jumlah',
//                   label: 'Arisan',
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
//               text: //uploadReportController.isCreateKaderPokja1.value
//                    'Loading'
//                    'UPLOAD',
//               textColor: Colors.white,
//               onPressed: () {},
//               ),
//               ),
//               ),
//               ),
//     );
//   }
// }
import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import 'package:e_pkk_nganjuk/get/controller/gotong_royong_controller.dart';

class GotongRoyongScreen extends StatefulWidget {
  const GotongRoyongScreen({super.key});

  @override
  State<GotongRoyongScreen> createState() => _GotongRoyongScreenState();
}

class _GotongRoyongScreenState extends State<GotongRoyongScreen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  final kerjabaktiController = TextEditingController();
  final rukunkematianController = TextEditingController();
  final keagamaanController = TextEditingController();
  final jimpitanController = TextEditingController();
  final arisanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GotongRoyongController gotongRoyongController = Get.find<GotongRoyongController>();

  void clearForm() {
    kerjabaktiController.clear();
    rukunkematianController.clear();
    keagamaanController.clear();
    jimpitanController.clear();
    arisanController.clear();
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
        title: 'Gotong Royong',
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
                  controller: kerjabaktiController,
                  hintText: 'Masukkan jumlah',
                  label: 'Kerja Bakti',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: rukunkematianController,
                  hintText: 'Masukkan jumlah',
                  label: 'Rukun Kematian',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: keagamaanController,
                  hintText: 'Masukkan jumlah',
                  label: 'Keagamaan',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jimpitanController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jimpitan',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: arisanController,
                  hintText: 'Masukkan jumlah',
                  label: 'Arisan',
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
              text: gotongRoyongController.isLoading.value
              ? 'Loading'
              : 'UPLOAD',
              textColor: Colors.white,
              onPressed: gotongRoyongController.isLoading.value 
              ? null
              : () async {
                final isFormValid = _formKey.currentState!.validate();

                if (isFormValid) {
                  try {
                    await gotongRoyongController.submitGotongRoyong(
                      idUser: id_user!, 
                      kerjaBakti: kerjabaktiController.text, 
                      rukunKematian: rukunkematianController.text, 
                      keagamaan: keagamaanController.text, 
                      jimpitan: jimpitanController.text, 
                      arisan: arisanController.text, 
                      idRole: id_role!, 
                      idOrganization: id_organization!
                      );
                      
                    if (gotongRoyongController.reportData.value != null
                        && 
                        gotongRoyongController.reportData.value!.statusCode == 200
                    ) {
                      _formKey.currentState?.reset();
                      clearForm();
                    } else {
                      String errorMessage = gotongRoyongController.errorMessage.value.isNotEmpty
                          ? gotongRoyongController.errorMessage.value
                          : 'Terjadi kesalahan, silakan coba lagi.';
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

  

