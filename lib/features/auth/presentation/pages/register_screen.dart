import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../../_core/component/button/button_fill.dart';
import '../../../../commons/constants/colors.dart';
import '../../../../commons/constants/typography.dart';
import '../../../../get/controller/auth_controller.dart';
import '../component/footer_text.dart';
import '../component/header_text.dart';
import '../component/icon_button_back.dart';
import '../component/input_form.dart';
import '../component/input_password.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _nomorController = TextEditingController();
  final _passController = TextEditingController();
  final _konfirmPassController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  late String roleId;
  late String roleName;

  @override
  void initState() {
    super.initState();
    roleId = Get.arguments['roleID'] ?? 'ID Not Found';
    roleName = Get.arguments['roleName'] ?? 'Not Found';
    print('Role ID: $roleId');
    print('Role: $roleName');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButtonBack(
                onTab: () {
                  Get.toNamed(Routes.AUTH_LOGIN, arguments: {'roleID': roleId, 'roleName': roleName});
                },
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
                          firstText: 'Daftar sebagai $roleName',
                          bodyText:
                              'Daftar sebagai $roleName merupakan pengguna Anggota PKK yang berasal dari Desa. Silahkan isikan form yang sudah disediakan untuk mendaftarkan akun anda',
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                        TypographyStyles.bodyCaptionMedium(
                          'Nama',
                          color: TextColors.grey700,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InputForm(
                          controller: _nameController,
                          hintText: 'Ahmad ...',
                          svgIconPath: 'assets/icons/ic_profile.svg',
                          inputFormatters: [],
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan nama anda';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TypographyStyles.bodyCaptionMedium(
                          'Nomor WhatsApp',
                          color: TextColors.grey700,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InputForm(
                          controller: _nomorController,
                          hintText: '0821xxxx',
                          svgIconPath: 'assets/icons/ic_call.svg',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan nomor whatsapp anda';
                            }
                            // else if (value.length < 11) {
                            //   return 'Minimal 11 digit angka';
                            // }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TypographyStyles.bodyCaptionMedium(
                          'Password',
                          color: TextColors.grey700,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InputPassword(
                          controller: _passController,
                          hintText: '••••••••••',
                          svgIconPath: 'assets/icons/ic_lock.svg',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan password anda';
                            }
                            // else if (value.length < 8) {
                            //   return 'Minimal 8 karakter';
                            // }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        TypographyStyles.bodyCaptionMedium(
                          'Konfirmasi password',
                          color: TextColors.grey700,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        InputPassword(
                          controller: _konfirmPassController,
                          hintText: '••••••••••',
                          svgIconPath: 'assets/icons/ic_lock.svg',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Masukkan konfirmasi password anda';
                            }
                            // else if (value.length < 8) {
                            //   return 'Minimal 8 karakter';
                            // }
                            return null;
                          },
                        ),
                        SizedBox(height: 16.h),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ZoomTapAnimation(
              child: Obx(
                () => ButtonFill(
                  text: "Lanjut",
                  textColor: Colors.white,
                  isLoading: authController.isAuthLogin.value,
                  onPressed: authController.isAuthLogin.value
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            // Validasi apakah password dan konfirmasi password cocok
                            authController.checkPasswordMatch(
                              _passController.text,
                              _konfirmPassController.text,
                            );

                            if (authController.passwordMismatch.value) {
                              Get.snackbar(
                                'Error',
                                'Password dan konfirmasi password tidak cocok',
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else {
                              Get.toNamed(Routes.PICK_ROLE, arguments: {
                                'roleID': roleId,
                                'roleName': roleName,
                                'nama_pengguna': _nameController.text,
                                'no_whatsapp': _nomorController.text,
                                'password': _passController.text,
                              });
                              print('Nama : ${_nameController.text}');
                              print('Wa : ${_nomorController.text}');
                              print('Pw : ${_passController.text}');
                            }
                          }
                        },
                ),
              ),
            ),
            SizedBox(height: 16.h),
            FooterText(
              firstText: 'Sudah punya akun?',
              secondText: 'Masuk',
              onTab: () {
                Get.toNamed(Routes.AUTH_LOGIN, arguments: {'roleID': roleId, 'roleName': roleName});
              },
            ),
          ],
        ),
      ),
    );
  }
}
