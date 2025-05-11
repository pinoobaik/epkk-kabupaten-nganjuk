import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/get/controller/kelestarian_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class KelestarianLingkungan1Screen extends StatefulWidget {
  const KelestarianLingkungan1Screen({super.key});

  @override
  State<KelestarianLingkungan1Screen> createState() => _Kelestarian1ScreenState();
}

class _Kelestarian1ScreenState extends State<KelestarianLingkungan1Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;
  
  final jambanController = TextEditingController();
  final spalController = TextEditingController();
  final sampahController = TextEditingController();
  final mckController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final KelestarianController uploadController = Get.find<KelestarianController>();

  void clearForm() {
    jambanController.clear();
    spalController.clear();
    sampahController.clear();
    mckController.clear();
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
        title: 'Kelestarian Lingkungan Hidup',
        currentStep: 1,
        totalSteps: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Step Progress Indicator
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
                  'Jumlah Rumah yang Memiliki',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jambanController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jamban',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: spalController,
                  hintText: 'Masukkan jumlah',
                  label: 'SPAL',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: sampahController,
                  hintText: 'Masukkan jumlah',
                  label: 'Tempat Pembuangan Sampah',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: mckController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah MCK',
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
                
                Get.toNamed(Routes.KELESTARIAN2, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'jamban': jambanController.text,
                'spal': spalController.text,
                'tps': sampahController.text,
                'mck': mckController.text,

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
          //     Get.toNamed('/kelestarian2', arguments: {
          //       'jamban': jambanController.text,
          //       'spal': spalController.text,
          //       'tempat_pembuangan_sampah': sampahController.text,
          //       'jumlah_mck': mckController.text,
          //     });
          //   },
          // ),
        ),
      ),
    );
  }
}