import 'package:e_pkk_nganjuk/get/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../_core/component/button/button_fill.dart';
import '../../../../commons/constants/colors.dart';
import '../../../../commons/constants/typography.dart';
import '../../../../routes/app_routes.dart';
import '../component/header_text.dart';
import '../component/icon_button_back.dart';
import '../component/input_form.dart';

class ForgetPasswordScreen extends StatefulWidget {
  //final String role;

  const ForgetPasswordScreen({
    super.key,
    //required this.role,
  });

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomorController = TextEditingController();
  final authController = Get.find<AuthController>();

  late String role;

  @override
  void initState() {
    super.initState();
    role = Get.arguments['role'] ?? 'Tidak diketahui';
    print('Role: $role');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButtonBack(
                onTab: () {
                  Get.toNamed(Routes.AUTH_LOGIN, arguments: {'role': role});
                },
              ),
              SizedBox(height: 32.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        HeaderText(
                          firstText: 'Atur Ulang Kata Sandi',
                          bodyText:
                              'Mohon masukkan nomor whatsaap anda yang sudah didaftarkan diaplikasi ini.',
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Image.asset(
                          'assets/images/ilustrasi3.png',
                          width: 248.w,
                          height: 267.h,
                        ),
                        SizedBox(
                          height: 32.h,
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
        child: ButtonFill(
          text: 'Lanjut',
          textColor: Colors.white,
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final phoneNumber = _nomorController.text;

              // Panggil generate dari controller
              authController.generateRandomNumber();
              final kodeOtp = authController.generatedOtp;

              try {
                await authController.sendOtpViaWhatsApp(phoneNumber, kodeOtp);

                Get.toNamed(
                  Routes.VERIFICATION_FORGOT_PASSWORD,
                  arguments: {
                    'phone_number': phoneNumber,
                    'kode_otp': kodeOtp,
                    'role': role,
                    // 'from': 'forget_password',
                  },
                );
              } catch (e) {
                Get.snackbar('Error', 'Gagal mengirim OTP: $e');
              }
            }
          }


        ),
      ),
    );
  }
}
