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

class KelestarianLingkungan2Screen extends StatefulWidget {
  const KelestarianLingkungan2Screen({super.key});

  @override
  State<KelestarianLingkungan2Screen> createState() => _KelestarianLingkungan2ScreenState();
}

class _KelestarianLingkungan2ScreenState extends State<KelestarianLingkungan2Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;
  String? jamban;
  String? spal;
  String? tps;
  String? mck;

  final pdamController = TextEditingController();
  final sumurController = TextEditingController();
  final lainnyaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final KelestarianController uploadController = Get.find<KelestarianController>();

  void clearForm() {
    pdamController.clear();
    sumurController.clear();
    lainnyaController.clear();
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
    jamban = args['jamban'];
    spal = args['spal'];
    tps = args['tps'];
    mck = args['mck'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }


  @override
  Widget build(BuildContext context) {
    
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Kelestarian Lingkungan Hidup',
        currentStep: 2,
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
                // Step Progress Bar
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
                  'Jumlah KART yang Menggunakan Air',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: pdamController,
                  hintText: 'Masukkan jumlah',
                  label: 'PDAM',
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: sumurController,
                  hintText: 'Masukkan jumlah',
                  label: 'Sumur',
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: lainnyaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Lain - lainnya',
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
                
                Get.toNamed(Routes.KELESTARIAN3, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'jamban': jamban,
                'spal': spal,
                'tps': tps,
                'mck': mck,
                'pdam': pdamController.text,
                'sumur': sumurController.text,
                'dll': lainnyaController.text,

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
          //       'pdam': pdamController.text,
          //       'sumur': sumurController.text,
          //       'lainnya': lainnyaController.text,
          //     };

          //     final combinedData = {
          //       ...previousData,
          //       ...newData,
          //     };

          //     Get.toNamed('/review_kelestarian', arguments: combinedData);
          //   },
          // ),
        ),
      ),
    );
  }
}