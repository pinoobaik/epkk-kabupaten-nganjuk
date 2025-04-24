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

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class GotongRoyongScreen extends StatelessWidget {
  const GotongRoyongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    final kerjabaktiController = TextEditingController();
    final rukunkematianController = TextEditingController();
    final keagamaanController = TextEditingController();
    final jimpitanController = TextEditingController();
    final arisanController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Gotong Royong',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              InputFormField(
                controller: kerjabaktiController,
                hintText: 'Masukkan jumlah',
                label: 'Kerja Bakti',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: rukunkematianController,
                hintText: 'Masukkan jumlah',
                label: 'Rukun Kematian',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: keagamaanController,
                hintText: 'Masukkan jumlah',
                label: 'Keagamaan',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: jimpitanController,
                hintText: 'Masukkan jumlah',
                label: 'Jimpitan',
              ),
              SizedBox(height: 24.h),
              InputFormField(
                controller: arisanController,
                hintText: 'Masukkan jumlah',
                label: 'Arisan',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ZoomTapAnimation(
          child: ButtonFill(
            text: 'UPLOAD',
            textColor: Colors.white,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
