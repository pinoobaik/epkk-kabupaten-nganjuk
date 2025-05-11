import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/laporan_umum_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LaporanUmum3Screen extends StatefulWidget {
  const LaporanUmum3Screen({super.key});

  @override
  State<LaporanUmum3Screen> createState() => _LaporanUmum2ScreenState();
}

class _LaporanUmum2ScreenState extends State<LaporanUmum3Screen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;
  String? dusun_lingkungan;
  String? PKK_RW;
  String? desa_wisma;
  String? KRT;
  String? KK;
  String? jiwa_laki;
  String? jiwa_perempuan;
  String? anggota_laki;
  String? anggota_perempuan;
  String? umum_laki;
  String? umum_perempuan;
  String? khusus_laki;
  String? khusus_perempuan;

  final lakilaki1Controller = TextEditingController();
  final perempuan1Controller = TextEditingController();
  final lakilaki2Controller = TextEditingController();
  final perempuan2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LaporanUmumController uploadController = Get.find<LaporanUmumController>();


  void clearForm() {
    lakilaki1Controller.clear();
    perempuan1Controller.clear();
    lakilaki2Controller.clear();
    perempuan2Controller.clear();
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
    dusun_lingkungan = args['dusun_lingkungan']; 
    PKK_RW = args['PKK_RW']; 
    desa_wisma = args['desa_wisma'];
    KRT = args['KRT']; 
    KK = args['KK'];
    jiwa_laki = args['jiwa_laki'];
    jiwa_perempuan = args['jiwa_perempuan'];
    anggota_laki = args['anggota_laki'];
    anggota_perempuan = args['anggota_perempuan']; 
    umum_laki = args['umum_laki']; 
    umum_perempuan = args['umum_perempuan'];
    khusus_laki = args['khusus_laki']; 
    khusus_perempuan = args['khusus_perempuan'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }

  @override
  Widget build(BuildContext context) {
    // hanya tampilan
    print('Role Upload Laporan: $name_role + $name_organization');
   
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Laporan Umum',
        currentStep: 3,
        totalSteps: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionBold(
                    'Jumlah Tenaga Sekretariat',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 32.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionSmallMedium(
                    'Honorer',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 16),
                InputFormField(
                  controller: lakilaki1Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Laki-laki',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: perempuan1Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Perempuan',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionSmallMedium(
                    'Bantuan',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 16),
                InputFormField(
                  controller: lakilaki2Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Laki-laki',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: perempuan2Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Perempuan',
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
                
                Get.toNamed(Routes.LAPORAN_UMUM4, arguments: {
                'id_user': id_user,
                'full_name': full_name,
                'id_role': id_role,
                'name_role': name_role,
                'id_organization': id_organization,
                'name_organization': name_organization,
                'dusun_lingkungan': dusun_lingkungan,
                'PKK_RW': PKK_RW,
                'desa_wisma': desa_wisma,
                'KRT': KRT,
                'KK': KK,
                'jiwa_laki': jiwa_laki,
                'jiwa_perempuan':  jiwa_perempuan,
                'anggota_laki': anggota_laki,
                'anggota_perempuan':  anggota_perempuan,
                'umum_laki': umum_laki,
                'umum_perempuan':  umum_perempuan,
                'khusus_laki': khusus_laki,
                'khusus_perempuan': khusus_perempuan,
                'honorer_laki': lakilaki1Controller.text,
                'honorer_perempuan':  perempuan1Controller.text,
                'bantuan_laki': lakilaki2Controller.text,
                'bantuan_perempuan': perempuan2Controller.text,
                
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
          //   text: 'UPLOAD',
          //   textColor: Colors.white,
          //   onPressed: () {},
          // ),
        ),
      ),
    );
  }
}

