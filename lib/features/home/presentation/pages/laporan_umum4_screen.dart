import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/laporan_umum_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pendidikan_keterampilan_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pengembangan_kehidupan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class LaporanUmum4Screen extends StatefulWidget {
  const LaporanUmum4Screen({super.key});

  @override
  State<LaporanUmum4Screen> createState() => _LaporanUmum4ScreenState();
}

class _LaporanUmum4ScreenState extends State<LaporanUmum4Screen> {
  final LaporanUmumController uploadController = Get.find<LaporanUmumController>();
  
  // Declare variables to store arguments
  late Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();
    data = Get.arguments;
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: TextColors.grey600,
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            value,
            style: TextStyle(
              color: TextColors.grey900,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TypographyStyles.bodyCaptionSemiBold(
          title,
          color: TextColors.grey900,
        ),
        SizedBox(height: 16.h),
        ...children,
        SizedBox(height: 24.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarSecondary(
        title: 'Laporan Umum',
        currentStep: 4,
        totalSteps: 4,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Warning Message
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.blue, size: 24.w),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Yakin datamu sudah benar?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: TextColors.grey900,
                            ),
                          ),
                          Text(
                            'Cek lagi yuk! Kalo ada kesalahan data kamu bisa edit dihalaman ini',
                            style: TextStyle(color: TextColors.grey600),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add edit functionality
                      },
                      child: Text('Edit'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Detail Laporan Section
              Text(
                'Detail Laporan',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: TextColors.grey900,
                ),
              ),
              SizedBox(height: 24.h),

              // Warga Buta Huruf
              //_buildDetailItem('Jumlah Warga yang masih buta huruf', data['warga_buta'] ?? '0'),
              _buildSection('Jumlah kelompok', [
                _buildDetailItem('Dusun/Lingkungan', data['dusun_lingkungan'] ?? '0'),
                _buildDetailItem('PKK RW', data['PKK_RW'] ?? '0'),
                _buildDetailItem('Desa Wisma', data['desa_wisma'] ?? '0'),
              ]),

              _buildSection('Jumlah', [
                _buildDetailItem('KRT', data['KRT'] ?? '0'),
                _buildDetailItem('KK', data['KK'] ?? '0'),
              ]),

              _buildSection('Jumlah Jiwa', [
                _buildDetailItem('Laki-laki', data['jiwa_laki'] ?? '0'),
                _buildDetailItem('Perempuan', data['jiwa_perempuan'] ?? '0'),
              ]),

              _buildSection('Jumlah kader',[
              // Paket Madya Section
              _buildSection('Anggota TP PKK', [
                _buildDetailItem('Laki-laki', data['anggota_laki'] ?? '0'),
                _buildDetailItem('Perempuan', data['anggota_perempuan'] ?? '0'),
              ]),

              // Paket utama Section
              _buildSection('Umum', [
                _buildDetailItem('Laki-laki', data['umum_laki'] ?? '0'),
                _buildDetailItem('Perempuan', data['umum_perempuan'] ?? '0'),
              ]),

              // Paket Mandiri Section
              _buildSection('Khusus', [
                _buildDetailItem('laki-laki', data['khusus_laki'] ?? '0'),
                _buildDetailItem('Perempuan', data['khusus_perempuan'] ?? '0'),
              ]),
              ]),

              _buildSection('Jumlah Tenaga Sekretariat',[
              // Paket Madya Section
              _buildSection('Honorer', [
                _buildDetailItem('Laki-laki', data['honorer_laki'] ?? '0'),
                _buildDetailItem('Perempuan', data['honorer_perempuan'] ?? '0'),
              ]),

              // Paket utama Section
              _buildSection('Bantuan', [
                _buildDetailItem('Laki-laki', data['bantuan_laki'] ?? '0'),
                _buildDetailItem('Perempuan', data['bantuan_perempuan'] ?? '0'),
              ]),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ZoomTapAnimation(
          child: Obx(
            () => ButtonFill(
              text: uploadController.isLoading.value
              ? 'Loading'
              : 'UPLOAD',
              textColor: Colors.white,
              //isLoading: uploadController.isLoading.value,
              onPressed: uploadController.isLoading.value
                  ? null
                  : () async {
                    try {
                      await uploadController.submitUmumData(
                        idUser: data['id_user'], 
                        dusunLingkungan: data['dusun_lingkungan'], 
                        pkkRw: data['PKK_RW'], 
                        desaWisma: data['desa_wisma'], 
                        krt: data['KRT'], 
                        kk: data['KK'], 
                        jiwaLaki: data['jiwa_laki'], 
                        jiwaPerempuan: data['jiwa_perempuan'], 
                        anggotaLaki: data['anggota_laki'], 
                        anggotaPerempuan: data['anggota_perempuan'], 
                        umumLaki: data['umum_laki'], 
                        umumPerempuan: data['umum_perempuan'], 
                        khususLaki: data['khusus_laki'], 
                        khususPerempuan: data['khusus_perempuan'], 
                        honorerLaki: data['honorer_laki'], 
                        honorerPerempuan: data['honorer_perempuan'], 
                        bantuanLaki: data['bantuan_laki'], 
                        bantuanPerempuan: data['bantuan_perempuan'], 
                        idRole: data['id_role'], 
                        idOrganization: data['id_organization'],
                        );
                        if (uploadController.reportData.value != null
                        &&
                        uploadController.reportData.value!.statusCode == 200
                        ) {
                          Get.snackbar(
                          'Berhasil',
                          'Laporan berhasil diupload!',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                         );
                        } else {
                          String errorMessage = uploadController.errorMessage.value.isNotEmpty
                          ? uploadController.errorMessage.value
                          : 'Terjadi kesalahan, silakan coba lagi.';

                      Get.snackbar(
                        'Error',
                        errorMessage,
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                        );
                        }
                    } on SocketException {
                    Get.snackbar(
                      'Error',
                      'Tidak ada koneksi internet. Silakan periksa koneksi Anda.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } on TimeoutException {
                    Get.snackbar(
                      'Error',
                      'Server tidak merespons, coba lagi nanti.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  } catch (e) {
                    Get.snackbar(
                      'Error',
                      'Terjadi kesalahan yang tidak diketahui.',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                      // Add submit functionality here
              },
            ),
          ),
        ),
      ),
    );
  }
}
// [import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
// import 'package:flutter/material.dart';

// class LaporanForm extends StatefulWidget {
//   @override
//   _LaporanFormState createState() => _LaporanFormState();
// }

// class _LaporanFormState extends State<LaporanForm> {
//   final _formKey = GlobalKey<FormState>();
//   // Controllers untuk setiap input field
//   TextEditingController dusunController = TextEditingController(text: "23");
//   TextEditingController pkkRwController = TextEditingController(text: "23");
//   // Tambahkan controller untuk field lainnya...

//   @override
//   void dispose() {
//     dusunController.dispose();
//     pkkRwController.dispose();
//     // Dispose semua controller
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarSecondary(
//         title: 'Laporan Umum',
//         currentStep: 4,
//         totalSteps: 4,
//       ), // AppBar yang sudah kamu miliki
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Cek lagi yuk! Kalau ada kesalahan data kamu bisa edit di halaman ini',
//                     style: TextStyle(fontSize: 16)),
//                 SizedBox(height: 20),
                
//                 _buildSectionTitle('Detail Laporan'),
//                 _buildInputGroup('Jumlah Kelompok', [
//                   {'label': 'Dusun / Lingkungan', 'controller': dusunController},
//                   {'label': 'PKK RW', 'controller': pkkRwController},
//                   {'label': 'Desa Wisma', 'controller': TextEditingController(text: "23")},
//                 ]),
                
//                 _buildInputGroup('Jumlah', [
//                   {'label': 'KRT', 'controller': TextEditingController(text: "23")},
//                   {'label': 'KK', 'controller': TextEditingController(text: "23")},
//                 ]),
                
//                 _buildInputGroup('Jumlah Jiwa', [
//                   {'label': 'Laki-laki', 'controller': TextEditingController(text: "23")},
//                   {'label': 'Perempuan', 'controller': TextEditingController(text: "23")},
//                 ]),

//                 // Tambahkan section lainnya sesuai pola yang sama
                
//                 SizedBox(height: 30),
//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (_formKey.currentState!.validate()) {
//                         // Proses simpan data
//                       }
//                     },
//                     child: Text('Kirim'),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 16),
//       child: Text(title, 
//           style: TextStyle(
//               fontSize: 18, 
//               fontWeight: FontWeight.bold,
//               color: Colors.blue[800])),
//     );
//   }

//   Widget _buildInputGroup(String groupTitle, List<Map<String, dynamic>> inputs) {
//     return Card(
//       elevation: 3,
//       margin: EdgeInsets.only(bottom: 16),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(groupTitle, style: TextStyle(fontWeight: FontWeight.w500)),
//             SizedBox(height: 12),
//             ...inputs.map((input) => Padding(
//               padding: EdgeInsets.only(bottom: 12),
//               child: TextFormField(
//                 controller: input['controller'],
//                 decoration: InputDecoration(
//                   labelText: input['label'],
//                   border: OutlineInputBorder(),
//                   isDense: true,
//                 ),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Harap diisi';
//                   }
//                   if (int.tryParse(value) == null) {
//                     return 'Harus angka';
//                   }
//                   return null;
//                 },
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }]