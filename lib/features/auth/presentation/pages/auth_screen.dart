import 'package:e_pkk_nganjuk/_core/utils/validators/validator_auth.dart';
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
import '../component/forget_password_text.dart';
import '../component/header_text.dart';
import '../component/icon_button_back.dart';
import '../component/input_form.dart';
import '../component/input_password.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomorController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthController authController = Get.find<AuthController>();

  late String roleId;
  late String roleName;

  @override
  void initState() {
    super.initState();
    roleId = Get.arguments['roleID'] ?? 'ID not found';
    roleName = Get.arguments['roleName'] ?? 'Tidak diketahui';
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
                  Get.offNamed(Routes.WELCOME);
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
                          firstText: 'Masuk sebagai $roleName',
                          bodyText:
                              'Masuk sebagai $roleName merupakan pengguna Anggota PKK yang berasal dari Desa. Silahkan masuk menggunakan akun yang sudah di daftarkan',
                        ),
                        SizedBox(
                          height: 40.h,
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
                          controller: _passwordController,
                          hintText: '••••••••••',
                          svgIconPath: 'assets/icons/ic_lock.svg',
                          validator: ValidatorAuth.validatePassword,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ForgetPasswordText(
                          onTab: () {
                            Get.toNamed(Routes.RESET_PASSWORD, arguments: {'role': roleName});
                          },
                        ),
                        SizedBox(height: 32.h),
                        ZoomTapAnimation(
                          child: Obx(
                            () => ButtonFill(
                              text: "Masuk",
                              textColor: Colors.white,
                              isLoading: authController.isAuthLogin.value,
                              onPressed: authController.isAuthLogin.value
                                  ? null
                                  : () async {
                                      if (_formKey.currentState!.validate()) {
                                        await authController.authLoginController(
                                          phoneNumber: _nomorController.text,
                                          password: _passwordController.text,
                                          role: roleId,
                                        );

                                        if (authController.authResponse.value != null) {
                                          Get.snackbar(
                                            'Berhasil',
                                            'Login berhasil! Selamat datang, ${authController.authResponse.value!.data!.fullName}',
                                            snackPosition: SnackPosition.TOP,
                                            backgroundColor: Colors.green,
                                            colorText: Colors.white,
                                          );
                                          Get.toNamed(Routes.HOME, arguments: {
                                            'role': authController.authResponse.value!.data!.role
                                          });
                                        } else {
                                          Get.snackbar(
                                            'Gagal Login',
                                            authController.errorMessage.value,
                                            snackPosition: SnackPosition.TOP,
                                            backgroundColor: Colors.red,
                                            colorText: Colors.white,
                                          );
                                        }
                                      }
                                    },
                            ),
                          ),
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
        child: FooterText(
          firstText: 'Belum punya akun?',
          secondText: 'Daftar',
          onTab: () {
            Get.toNamed(Routes.REGISTER, arguments: {'roleID': roleId, 'roleName': roleName});
          },
        ),
      ),
    );
  }
}
