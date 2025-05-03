import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/_core/utils/validators/validator_form.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PenghayatanPengamalanScreen extends StatefulWidget {
  const PenghayatanPengamalanScreen({super.key});

  @override 
  State<PenghayatanPengamalanScreen> createState() => _PenghayatanPengamalanScreenState();
}

class _PenghayatanPengamalanScreenState extends State<PenghayatanPengamalanScreen> {
  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

  final jumlahkel1Controller = TextEditingController();
  final jumlahanggota1Controller = TextEditingController();
  final jumlahkel2Controller = TextEditingController();
  final jumlahanggota2Controller = TextEditingController();
  final jumlahkel3Controller = TextEditingController();
  final jumlahanggota3Controller = TextEditingController();
  final jumlahkel4Controller = TextEditingController();
  final jumlahanggota4Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void clearForm() {
    jumlahkel1Controller.clear();
    jumlahanggota1Controller.clear();
    jumlahkel2Controller.clear();
    jumlahanggota2Controller.clear();
    jumlahkel3Controller.clear();
    jumlahanggota3Controller.clear();
    jumlahkel4Controller.clear();
    jumlahanggota4Controller.clear();
  }

  @override
  void initState() {
    super.initState();

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
        title: 'Penghayatan & Pengamalan Pancasila',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionMedium(
                    'Sosialisasi Pendidikan PKBN',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel1Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota1Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionMedium(
                    'PKDRT',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel2Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota2Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),

                SizedBox(height: 24.h),
                Container(
                  alignment: Alignment.centerLeft,
                  child: TypographyStyles.bodyCaptionMedium(
                    'Pola Asuh',
                    color: TextColors.grey700,
                  ),
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel3Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota3Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                TypographyStyles.bodyCaptionMedium(
                  'Lansia',
                  color: TextColors.grey700,
                ),
                SizedBox(height: 12.h),
                InputFormField(
                  controller: jumlahkel4Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Kel. Simulasi',
                  validator: (value) => ValidatorForm.validateDefault(value),
                ),
                SizedBox(height: 24.h),
                InputFormField(
                  controller: jumlahanggota4Controller,
                  hintText: 'Masukkan jumlah',
                  label: 'Jumlah Anggota',
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

  
