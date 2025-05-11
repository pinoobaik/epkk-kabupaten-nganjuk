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

class PendidikanKetrampilan3Screen extends StatefulWidget {
  const PendidikanKetrampilan3Screen({super.key});

  @override
  State<PendidikanKetrampilan3Screen> createState() => _Pendidikan3ScreenState();
}

class _Pendidikan3ScreenState extends State<PendidikanKetrampilan3Screen> {
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
  String? kel_belajarC;
  String? warga_belajarC;
  String? kel_belajarKF;
  String? warga_belajarKF;
  String? paud;
  String? taman_bacaan;

  final klpController = TextEditingController();
  final ibuPesertaController = TextEditingController();
  final apeController = TextEditingController();
  final kelSimulasiController = TextEditingController();
  final tutorKFController = TextEditingController();
  final tutorPaudController = TextEditingController();
  final kaderBKPController = TextEditingController();
  final koperasiController = TextEditingController();
  final ketrampilanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PendidikanKeterampilanController uploadController = Get.find<PendidikanKeterampilanController>();

  void clearForm() {
    klpController.clear();
    ibuPesertaController.clear();
    apeController.clear();
    kelSimulasiController.clear();
    tutorKFController.clear();
    tutorPaudController.clear();
    kaderBKPController.clear();
    koperasiController.clear();
    ketrampilanController.clear();
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
    kel_belajarC = args['kel_belajarC'];
    warga_belajarC = args['warga_belajarC'];
    kel_belajarKF = args['kel_belajarKF'];
    warga_belajarKF = args['warga_belajarKF'];
    paud = args['paud'];
    taman_bacaan = args['taman_bacaan'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }


  @override
  Widget build(BuildContext context) {
    
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Pendidikan & Keterampilan',
        currentStep: 3,
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
                // Indikator langkah
                // Row(
                //   children: List.generate(5, (index) {
                //     return Expanded(
                //       child: Container(
                //         height: 4.h,
                //         margin: EdgeInsets.only(right: index < 4 ? 4.w : 0),
                //         decoration: BoxDecoration(
                //           color: index <= 2 ? Colors.blue : Colors.grey[300],
                //           borderRadius: BorderRadius.circular(4.r),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                SizedBox(height: 32.h),

                TypographyStyles.bodyCaptionSemiBold(
                  'BKP',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: klpController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah KLP',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: ibuPesertaController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah ibu peserta',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: apeController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah APE (SET)',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: kelSimulasiController,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 28.h),

                TypographyStyles.bodyCaptionSemiBold(
                  'Kader Khusus',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 12.h),

                TypographyStyles.bodyCaptionSemiBold(
                  'Tutor',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: tutorKFController,
                  hintText: 'Masukkan jumlah',
                  label: 'KF',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: tutorPaudController,
                  hintText: 'Masukkan jumlah',
                  label: 'Paud / sejenis',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: kaderBKPController,
                  hintText: 'Masukkan jumlah',
                  label: 'BKP',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: koperasiController,
                  hintText: 'Masukkan jumlah',
                  label: 'Koperasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),
                InputFormField(
                  controller: ketrampilanController,
                  hintText: 'Masukkan jumlah',
                  label: 'Keterampilan',
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
                Get.toNamed(Routes.PENDIDIKAN4, arguments: {
                
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
                'kel_belajarC': kel_belajarC,
                'warga_belajarC': warga_belajarC,
                'kel_belajarKF': kel_belajarKF,
                'warga_belajarKF': warga_belajarKF,
                'paud': paud,
                'taman_bacaan': taman_bacaan,
                'jumlah_klp': klpController.text,
                'jumlah_ibu_peserta': ibuPesertaController.text,
                'jumlah_ape': apeController.text,
                'jumlah_kel_simulasi': kelSimulasiController.text,
                'KF': tutorKFController.text,
                'paud_tutor': tutorPaudController.text,
                'BKB': kaderBKPController.text,
                'koperasi': koperasiController.text,
                'ketrampilan': ketrampilanController.text,
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