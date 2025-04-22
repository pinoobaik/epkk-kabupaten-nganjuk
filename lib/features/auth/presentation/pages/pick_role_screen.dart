import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/drop_down.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../get/controller/auth_controller.dart';
import '../../../../get/controller/pick_role_controller.dart';
import '../../../../routes/app_routes.dart';
import '../../data/model/dropdown_model.dart';
import '../component/header_text.dart';
import '../component/icon_button_back.dart';

class PickRoleScreen extends StatelessWidget {
  final PickRoleController pickRoleController = Get.put(PickRoleController());
  final _formKey = GlobalKey<FormState>();
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final role = Get.arguments['roleID'] ?? 'ID Not Found';
    final roleName = Get.arguments['roleName'] ?? 'Not Found';
    final namaPengguna = Get.arguments['nama_pengguna'] ?? 'Not Found';
    final noWhatsapp = Get.arguments['no_whatsapp'] ?? 'Not Found';
    final password = Get.arguments['password'] ?? 'Not Found';
    print('Role: $role');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButtonBack(
                onTab: () {},
              ),
              SizedBox(height: 32.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderText(
                          firstText: 'Pilih Wilayah & Posisi',
                          bodyText:
                              'Anda dapat memasukkan nama kecamatan, nama desa dan role bidang sesuai dengan posisi Anda sekarang.',
                        ),
                        SizedBox(height: 32.h),
                        TypographyStyles.bodyCaptionMedium(
                          'Kecamatan',
                          color: TextColors.grey700,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        DropdownComponent(
                          randomlabel: 'Pilih Kecamatan',
                          errorKosong: 'Harap pilih kecamatan anda',
                          listItem: kecamatanList.map((k) => k.name).toList(),
                          hintText: 'Pilih kecamatan',
                          svgIconPath: 'assets/icons/ic_location.svg',
                          onChanged: (selectedKecamatan) {
                            pickRoleController.updateKecamatan(selectedKecamatan);
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TypographyStyles.bodyCaptionMedium(
                          'Desa',
                          color: TextColors.grey700,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Obx(
                          () => DropdownComponent(
                            randomlabel: 'Pilih Desa',
                            errorKosong: 'Harap pilih desa anda',
                            listItem: pickRoleController.desaList,
                            hintText: 'Pilih desa',
                            svgIconPath: 'assets/icons/ic_location.svg',
                            selectedValue: pickRoleController.selectedDesa.value.isNotEmpty
                                ? pickRoleController.selectedDesa.value
                                : null,
                            onChanged: (selectedDesa) {
                              pickRoleController.updateDesa(selectedDesa);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TypographyStyles.bodyCaptionMedium(
                          'Role bidang',
                          color: TextColors.grey700,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        DropdownComponent(
                          maxHeight: 200.h,
                          randomlabel: 'Pilih Role',
                          errorKosong: 'Harap pilih role anda',
                          listItem: pickRoleController.roleBidang,
                          hintText: 'Pilih role bidang',
                          svgIconPath: 'assets/icons/ic_user_tag.svg',
                          onChanged: (selectedRole) {
                            pickRoleController.updateSelectedRole(selectedRole);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ZoomTapAnimation(
          child: ButtonFill(
            text: 'Lanjut',
            textColor: Colors.white,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Validator: Form is valid');

                // pickRoleController.sendKodeOtp(noWhatsapp);

                Get.toNamed(Routes.VERIFICATION, arguments: {
                  'roleID': role,
                  'roleName': roleName,
                  'nama_pengguna': namaPengguna,
                  'no_whatsapp': noWhatsapp,
                  'password': password,
                  'kecamatan': pickRoleController.kecamatanSelected.value,
                  'desa': pickRoleController.selectedDesa.value,
                  'role_bidang': pickRoleController.selectedRoleBidang.value,
                  'kode_otp': pickRoleController.randomNumber,
                });
                print(
                      'Nama : ${namaPengguna} ' +
                      'Wa : ${noWhatsapp} ' +
                      'Pw : ${password} ' +
                      'Kecamatan : ${pickRoleController.kecamatanSelected.value} ' +
                      'Desa : ${pickRoleController.selectedDesa.value} ' +
                      'roleBidang : ${pickRoleController.selectedRoleBidang.value} ' +
                      'Kode OTP : ${pickRoleController.randomNumber}',
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
