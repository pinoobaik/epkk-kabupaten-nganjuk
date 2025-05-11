import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/pangan_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Pangan1Screen extends StatefulWidget {
  const Pangan1Screen({super.key});

  @override
  State<Pangan1Screen> createState() => _Pangan1ScreenState();
}

class _Pangan1ScreenState extends State<Pangan1Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  
  final berasController = TextEditingController();
  final nonBerasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PanganController uploadController = Get.find<PanganController>();

  void clearForm() {
    berasController.clear();
    nonBerasController.clear();
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
        title: 'Pangan',
        currentStep: 1,
        totalSteps: 3,
        //subtitle: 'Langkah 1 dari 3',
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
                //           color: index == 0 ? Colors.blue : Colors.grey[300],
                //           borderRadius: BorderRadius.circular(4.r),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                SizedBox(height: 32.h),

                TypographyStyles.bodyCaptionSemiBold(
                  'Makanan Pokok',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 24.h),

                InputFormField(
                  controller: berasController,
                  hintText: 'Masukkan jumlah',
                  label: 'Beras',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: nonBerasController,
                  hintText: 'Masukkan jumlah',
                  label: 'Non Beras',
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
                
                Get.toNamed(Routes.PANGAN2, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'beras': berasController.text,
                'non_beras': nonBerasController.text,
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