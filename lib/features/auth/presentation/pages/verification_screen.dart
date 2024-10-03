// import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
//
// import '../../../../get/controller/auth_controller.dart';
// import '../component/footer_text.dart';
// import '../component/header_text.dart';
// import '../component/pin_code_fields.dart';
//
// class VerificationScreen extends StatefulWidget {
//   const VerificationScreen({super.key});
//
//   @override
//   State<VerificationScreen> createState() => _VerificationScreenState();
// }
//
// class _VerificationScreenState extends State<VerificationScreen> {
//   final AuthController authController = Get.find<AuthController>();
//   final _codeController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//
//   late String role;
//
//   @override
//   void initState() {
//     super.initState();
//     role = Get.arguments['role'] ?? 'Tidak diketahui';
//     print('Role: $role');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final role = Get.arguments['role'] ?? 'Tidak diketahui';
//     final namaPengguna = Get.arguments['nama_pengguna'] ?? '';
//     final noWhatsapp = Get.arguments['no_whatsapp'] ?? '';
//     final password = Get.arguments['password'] ?? '';
//     final kecamatan = Get.arguments['kecamatan'] ?? '';
//     final desa = Get.arguments['desa'] ?? '';
//     final roleBidang = Get.arguments['role_bidang'] ?? '';
//     final kodeOtp = Get.arguments['kode_otp']?.toString() ?? '';
//     final String status = 'verif';
//
//     print('Expected OTP: $kodeOtp'); // Debug: Print expected OTP
//     print('Arguments received in VerificationScreen: ${Get.arguments}');
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 32.h),
//               Expanded(
//                   child: SingleChildScrollView(
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       HeaderText(
//                         firstText: 'Kode Verifikasi',
//                         bodyText:
//                             'Masukkan kode verifikasi yang sudah kami kirimkan ke nomor whatsapp Anda.',
//                       ),
//                       SizedBox(height: 20.h),
//                       Center(
//                         child: Image.asset(
//                           'assets/images/ilustrasi2.png',
//                           width: 150.w,
//                           height: 260.h,
//                         ),
//                       ),
//                       SizedBox(height: 32.h),
//                       PinCodeFields(
//                         controller: _codeController,
//                       ),
//                       SizedBox(height: 20.h),
//                       FooterText(
//                         firstText: 'Belum menerima kode?',
//                         secondText: 'Kirim ulang',
//                         onTab: () {},
//                       )
//                     ],
//                   ),
//                 ),
//               ))
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
//         child: Obx(
//           () => ButtonFill(
//             text: authController.isLoading.value ? 'Loading...' : 'Konfirmasi',
//             textColor: Colors.white,
//             onPressed: authController.isLoading.value
//                 ? null
//                 : () async {
//                     final isFormValid = _formKey.currentState!.validate();
//
//                     if (isFormValid) {
//                       if (_codeController.text == kodeOtp) {
//                         await authController.authRegisterController(
//                           nama_pengguna: namaPengguna,
//                           noWhatsapp: noWhatsapp,
//                           kecamatan: kecamatan,
//                           desa: desa,
//                           role: role,
//                           roleBidang: roleBidang,
//                           password: password,
//                           kodeOtp: _codeController.text,
//                           status: status,
//                         );
//                       } else {
//                         Get.snackbar(
//                           'Error',
//                           'Kode OTP tidak sesuai!',
//                           snackPosition: SnackPosition.TOP,
//                           backgroundColor: Colors.red,
//                           colorText: Colors.white,
//                         );
//                       }
//                     } else {
//                       Get.snackbar('Error', 'Form tidak valid!');
//                     }
//                   },
//           ),
//         ),
//       ),
//     );
//   }
// }
