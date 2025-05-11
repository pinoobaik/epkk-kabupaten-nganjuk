import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/pendidikan_keterampilan_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PendidikanKetrampilan2Screen extends StatefulWidget {
  const PendidikanKetrampilan2Screen({super.key});

  @override
  State<PendidikanKetrampilan2Screen> createState() => _Pendidikan2ScreenState();
}

class _Pendidikan2ScreenState extends State<PendidikanKetrampilan2Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;
  String? warga_buta;
  String? kel_belajarA;
  String? warga_belajarA;
  String? kel_belajarB;
  String? warga_belajarB;

  final paketCKelController = TextEditingController();
  final paketCWargaController = TextEditingController();
  final paketKFKelController = TextEditingController();
  final paketKFWargaController = TextEditingController();
  final paudController = TextEditingController();
  final tamanBacaanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PendidikanKeterampilanController uploadController = Get.find<PendidikanKeterampilanController>();


  void clearForm() {
    paketCKelController.clear();
    paketCWargaController.clear();
    paketKFKelController.clear();
    paketKFWargaController.clear();
    tamanBacaanController.clear();
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
    warga_buta = args['warga_buta'];
    kel_belajarA = args['kel_belajarA'];
    warga_belajarA = args['warga_belajarA'];
    kel_belajarB = args['kel_belajarB'];
    warga_belajarB = args['warga_belajarB'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }

  @override
  Widget build(BuildContext context) {
    
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Pendidikan & Keterampilan',
        currentStep: 2,
        totalSteps: 5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // // Indikator langkah
                // Row(
                //   children: List.generate(5, (index) {
                //     return Expanded(
                //       child: Container(
                //         height: 4.h,
                //         margin: EdgeInsets.only(right: index < 4 ? 4.w : 0),
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
                  'Paket C',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: paketCKelController,
                  hintText: 'Masukkan jumlah',
                  label: 'Kel. Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: paketCWargaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Warga Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 28.h),
                TypographyStyles.bodyCaptionSemiBold(
                  'Paket KF',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: paketKFKelController,
                  hintText: 'Masukkan jumlah',
                  label: 'Kell. Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: paketKFWargaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Warga Belajar',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 28.h),
                InputFormField(
                  controller: paudController,
                  hintText: 'Masukkan jumlah',
                  label: 'Paud / sejenis',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: tamanBacaanController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah taman bacaan / perpustakaan',
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
            text: 'Lanjut',
            textColor: Colors.white,
            isLoading: uploadController.isLoading.value,
            onPressed: uploadController.isLoading.value
            ? null
            : () {
              if (_formKey.currentState!.validate()) {
                Get.toNamed(Routes.PENDIDIKAN3, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'warga_buta': warga_buta,
                'kel_belajarA': kel_belajarA,
                'warga_belajarA': warga_belajarA,
                'kel_belajarB': kel_belajarB,
                'warga_belajarB': warga_belajarB,
                'kel_belajarC': paketCKelController.text,
                'warga_belajarC': paketCWargaController.text,
                'kel_belajarKF': paketKFKelController.text,
                'warga_belajarKF': paketKFWargaController.text,
                'paud': paudController.text,
                'taman_bacaan': tamanBacaanController.text,
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
              },
            ),
          ),
        ),
      ),
    );
  }
}