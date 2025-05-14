import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/features/auth/presentation/component/icon_button_back.dart';
import 'package:e_pkk_nganjuk/get/controller/pick_role_controller.dart';
import 'package:e_pkk_nganjuk/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../get/controller/auth_controller.dart';
import '../component/footer_text.dart';
import '../component/header_text.dart';
import '../component/pin_code_fields.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final AuthController authController = Get.find<AuthController>();
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late String role;

  @override
  void initState() {
    super.initState();
    // role = Get.arguments['roleID'] ?? 'Tidak diketahui';
    // print('Role: $role');
  }

  // int getRoleBidangId(String roleName) {
  //   switch (roleName) {
  //     case 'Pokja 1':
  //       return 1;
  //     case 'Pokja 2':
  //       return 2;
  //     case 'Pokja 3':
  //       return 3;
  //     case 'Pokja 4':
  //       return 4;
  //     case 'Laporan Umum':
  //       return 5;
  //     default:
  //       return 0;
  //     }
  // }

  @override
  Widget build(BuildContext context) {
    final role_id = Get.arguments['role_id'] ?? 'ID Not Found';
    final role_name = Get.arguments['role_name'] ?? 'Not Found';
    final full_name = Get.arguments['full_name'] ?? 'Not Found';
    final phone_number = Get.arguments['phone_number'] ?? 'Not Found';
    final password = Get.arguments['password'] ?? 'Not Found';
    final kode_otp = Get.arguments['kode_otp'] ?? 'Not Found';
    final id_subdistrict = Get.arguments['id_subdistrict'] ?? 'Not Found';
    final id_village = Get.arguments['id_village'] ?? 'Not Found';
    final organization_name = Get.arguments['organization_name'] ?? 'Not Found';
    final id_organization = Get.arguments['id_organization']?.toString() ?? 'Not Found';
    print('role_id : $role_id');
    print('role_name : $role_name');
    print('full_name : $full_name');
    print('phone_number : $phone_number');
    print('password : $password');
    print('kode_otp : $kode_otp');
    print('id_subdistrict : $id_subdistrict');
    print('id_village : $id_village');
    print('organization_name : $organization_name');
    print('id_organization : $id_organization');
      // final roleBidang = Get.arguments['role_bidang'] ?? '';
    // final roleBidang = (Get.arguments['role_bidang'] is int)
    //   ? Get.arguments['role_bidang'].toString()
    //   : (Get.arguments['role_bidang'] ?? '');
    // final kodeOtp = Get.arguments['kode_otp']?.toString() ?? '';
    // final String status = 'Active';

    // print('Expected OTP: $kodeOtp'); // Debug: Print expected OTP
    // print('Arguments received in VerificationScreen: ${Get.arguments}');

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
                  Get.find<PickRoleController>().generateRandomNumber();
                  Get.toNamed(Routes.PICK_ROLE, arguments: {
                    'role_id': role_id, 
                    'role_name': role_name,
                    'full_name': full_name,
                    'phone_number': phone_number,
                    'password': password
                    });
                },
              ),
              SizedBox(height: 32.h),
              Expanded(
                  child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderText(
                        firstText: 'Kode Verifikasi',
                        bodyText:
                            'Masukkan kode verifikasi yang sudah kami kirimkan ke nomor whatsapp Anda.',
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: Image.asset(
                          'assets/images/ilustrasi2.png',
                          width: 150.w,
                          height: 260.h,
                        ),
                      ),
                      SizedBox(height: 32.h),
                      PinCodeFields(
                        controller: _codeController,
                      ),
                      SizedBox(height: 20.h),
                      FooterText(
                        firstText: 'Belum menerima kode?',
                        secondText: 'Kirim ulang',
                        onTab: () {},
                      )
                    ],
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Obx(
          () => ButtonFill(
            text: authController.isAuthRegister.value ? 'Loading...' : 'Konfirmasi',
            textColor: Colors.white,
            onPressed: authController.isAuthRegister.value
                ? null
                : () async {
                    final isFormValid = _formKey.currentState!.validate();

                    if (isFormValid) {
                      if (_codeController.text == kode_otp) {
                        await authController.authRegisterController(
                          full_name: full_name,
                          phone_number: phone_number,
                          id_subdistrict: id_subdistrict,
                          id_village: id_village,
                          role_id: role_id,
                          id_organization: id_organization,
                          password: password,
                          kode_otp: kode_otp,
                          // nama_pengguna: namaPengguna,
                          // noWhatsapp: noWhatsapp,
                          // kecamatan: kecamatan,
                          // desa: desa,
                          // role: role,
                          // roleBidang: roleBidang,
                          // password: password,
                          // kodeOtp: _codeController.text,
                          // status: status,
                        );
                        print('Auth Response: ${authController.authResponses.value}');
                        if (authController.authResponses.value?.data != null) {
                          Get.snackbar(
                          'Berhasil',
                          'Membuat akun berhasil! Selamat datang, ${authController.authResponses.value!.data!.fullName}',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        Get.toNamed(Routes.MAIN, arguments: {
                          // 'role': authController.authResponses.value!.data!.role
                          });
                        }
                      } else {
                        Get.snackbar(
                          'Error',
                          'Kode OTP tidak sesuai!',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    } else {
                      Get.snackbar('Error', 'Form tidak valid!');
                    }
                  },
          ),
        ),
      ),
    );
  }
}
