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

class PendidikanKetrampilan4Screen extends StatefulWidget {
  const PendidikanKetrampilan4Screen({super.key});

  @override
  State<PendidikanKetrampilan4Screen> createState() => _Pendidikan4ScreenState();
}

class _Pendidikan4ScreenState extends State<PendidikanKetrampilan4Screen> {
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
  String? jumlah_klp;
  String? jumlah_ibu_peserta;
  String? jumlah_ape;
  String? jumlah_kel_simulasi;
  String? KF;
  String? paud_tutor;
  String? BKB;
  String? koperasi;
  String? ketrampilan;

  final lp3Controller = TextEditingController();
  final tp3Controller = TextEditingController();
  final damasController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final PendidikanKeterampilanController uploadController = Get.find<PendidikanKeterampilanController>();

  void clearForm() {
    lp3Controller.clear();
    tp3Controller.clear();
    damasController.clear();
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
    jumlah_klp = args['jumlah_klp'];
    jumlah_ibu_peserta = args['jumlah_ibu_peserta'];
    jumlah_ape = args['jumlah_ape'];
    jumlah_kel_simulasi = args['jumlah_kel_simulasi'];
    KF = args['KF'];
    paud_tutor = args['paud_tutor'];
    BKB = args['BKB'];
    koperasi = args['koperasi'];
    ketrampilan = args['ketrampilan'];

    print('Diterima dari argument: id_user=$id_user, id_role=$id_role, id_org=$id_organization');
  }

  @override
  Widget build(BuildContext context) {
    
    print('Role Upload Laporan: $name_role + $name_organization');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Pendidikan & Keterampilan',
        currentStep: 4,
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
                // Progress Bar
                // Row(
                //   children: List.generate(5, (index) {
                //     return Expanded(
                //       child: Container(
                //         height: 4.h,
                //         margin: EdgeInsets.only(right: index < 4 ? 4.w : 0),
                //         decoration: BoxDecoration(
                //           color: index <= 3 ? Colors.blue : Colors.grey[300],
                //           borderRadius: BorderRadius.circular(4.r),
                //         ),
                //       ),
                //     );
                //   }),
                // ),
                SizedBox(height: 32.h),

                TypographyStyles.bodyCaptionSemiBold(
                  'Jumlah Kader yang Sudah Dilatih',
                  color: TextColors.grey900,
                ),
                SizedBox(height: 24.h),

                InputFormField(
                  controller: lp3Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'LP3PKK',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),

                InputFormField(
                  controller: tp3Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'TP3PKK',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 20.h),

                InputFormField(
                  controller: damasController,
                  hintText: 'Masukkan jumlah',
                  label: 'DAMAS PKK',
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
                Get.toNamed(Routes.PENDIDIKAN5, arguments: {
                
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
                'jumlah_klp': jumlah_klp,
                'jumlah_ibu_peserta': jumlah_ibu_peserta,
                'jumlah_ape': jumlah_ape,
                'jumlah_kel_simulasi': jumlah_kel_simulasi,
                'KF': KF,
                'paud_tutor': paud_tutor,
                'BKB': BKB,
                'koperasi': koperasi,
                'ketrampilan': ketrampilan,
                'LP3PKK':lp3Controller.text,
                'TP3PKK':tp3Controller.text,
                'damas_pkk':damasController.text,
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