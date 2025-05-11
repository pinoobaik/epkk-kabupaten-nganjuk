import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/pangan_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Pangan2Screen extends StatefulWidget {
  const Pangan2Screen({super.key});

  @override
  State<Pangan2Screen> createState() => _Pangan1ScreenState();
}

class _Pangan1ScreenState extends State<Pangan2Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;
  String? beras;
  String? non_beras;

  final peternakanController = TextEditingController();
  final perikananController = TextEditingController();
  final warungHidupController = TextEditingController();
  final lumbungHidupController = TextEditingController();
  final togaController = TextEditingController();
  final tanamanKerasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PanganController uploadController = Get.find<PanganController>();

  void clearForm() {
    peternakanController.clear();
    perikananController.clear();
    warungHidupController.clear();
    lumbungHidupController.clear();
    togaController.clear();
    tanamanKerasController.clear();
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
    beras = args['beras'];
    non_beras = args['non_beras'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }


  @override
  Widget build(BuildContext context) {

    print('Role Upload Laporan: $name_role + $name_organization');
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Pangan',
        currentStep: 2,
        totalSteps: 3,
        //subtitle: 'Langkah 2 dari 3',
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
                //           color: index <= 1 ? Colors.blue : Colors.grey[300],
                //           borderRadius: BorderRadius.circular(4.r),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                SizedBox(height: 32.h),

                TypographyStyles.bodyCaptionSemiBold(
                  'Pemanfaatan Pekarangan / Hatinya PKK',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 24.h),

                InputFormField(
                  controller: peternakanController,
                  hintText: 'Masukkan jumlah',
                  label: 'Peternakan',
                ),
                SizedBox(height: 20.h),

                InputFormField(
                  controller: perikananController,
                  hintText: 'Masukkan jumlah',
                  label: 'Perikanan',
                ),
                SizedBox(height: 20.h),

                InputFormField(
                  controller: warungHidupController,
                  hintText: 'Masukkan jumlah',
                  label: 'Warung Hidup',
                ),
                SizedBox(height: 20.h),

                InputFormField(
                  controller: lumbungHidupController,
                  hintText: 'Masukkan jumlah',
                  label: 'Lumbung Hidup',
                ),
                SizedBox(height: 20.h),

                InputFormField(
                  controller: togaController,
                  hintText: 'Masukkan jumlah',
                  label: 'TOGA',
                ),
                SizedBox(height: 20.h),

                InputFormField(
                  controller: tanamanKerasController,
                  hintText: 'Masukkan jumlah',
                  label: 'Tanaman Keras',
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
                
                Get.toNamed(Routes.PANGAN3, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'beras': beras,
                'non_beras': non_beras,
                'peternakan': peternakanController.text,
                'perikanan': perikananController.text,
                'warung_hidup': warungHidupController.text,
                'lumbung_hidup': lumbungHidupController.text,
                'toga': togaController.text,
                'tanaman_keras': tanamanKerasController.text,
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
          //   text: 'Review',
          //   textColor: Colors.white,
          //   onPressed: () {
          //     final previousData = Get.arguments ?? {};

          //     final newData = {
          //       'peternakan': peternakanController.text,
          //       'perikanan': perikananController.text,
          //       'warungHidup': warungHidupController.text,
          //       'lumbungHidup': lumbungHidupController.text,
          //       'toga': togaController.text,
          //       'tanamanKeras': tanamanKerasController.text,
          //     };

          //     final combinedData = {
          //       ...previousData,
          //       ...newData,
          //     };

          //     Get.toNamed('/review_pangan', arguments: combinedData);
          //   },
          // ),
        ),
      ),
    );
  }
}