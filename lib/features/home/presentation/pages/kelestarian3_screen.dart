import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/kelestarian_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pendidikan_keterampilan_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pengembangan_kehidupan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Kelestarian3Screen extends StatefulWidget {
  const Kelestarian3Screen({super.key});

  @override
  State<Kelestarian3Screen> createState() => _Kelestarian3ScreenState();
}

class _Kelestarian3ScreenState extends State<Kelestarian3Screen> {
  final KelestarianController uploadController = Get.find<KelestarianController>();
  
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
        title: 'Kelestarian Lingkungan Hidup',
        currentStep: 3,
        totalSteps: 3,
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
              // _buildSection('Kader Khusus',[
              // Paket Pemula Section
              _buildSection('Jumlah Rumah Yang Memiliki', [
                _buildDetailItem('Jamban', data['jamban'] ?? '0'),
                _buildDetailItem('SPAL', data['spal'] ?? '0'),
                _buildDetailItem('Tempat Pembuangan Sampah', data['tps'] ?? '0'),
                _buildDetailItem('Jumlah MCK', data['mck'] ?? '0'),
              ]),

              _buildSection('Jumlah KART Yang Menggunakan Air', [
                _buildDetailItem('PDAM', data['pdam'] ?? '0'),
                _buildDetailItem('Sumur', data['sumur'] ?? '0'),
                _buildDetailItem('Lain-lainya', data['dll'] ?? '0'),
                // _buildDetailItem('Jumlah Peserta', data['jumlah_peserta_pemula'] ?? '0'),
              ]),

              // Paket Madya Section
            //   _buildSection('Madya', [
            //     _buildDetailItem('Jumlah kelompok', data['jumlah_kelompok_madya'] ?? '0'),
            //     _buildDetailItem('Jumlah Peserta', data['jumlah_peserta_madya'] ?? '0'),
            //   ]),

            //   // Paket utama Section
            //   _buildSection('Utama', [
            //     _buildDetailItem('Jumlah kelompok', data['jumlah_kelompok_utama'] ?? '0'),
            //     _buildDetailItem('Jumlah Peserta', data['jumlah_peserta_utama'] ?? '0'),
            //   ]),

            //   // Paket Mandiri Section
            //   _buildSection('Mandiri', [
            //     _buildDetailItem('Jumlah kelompok', data['jumlah_kelompok_mandiri'] ?? '0'),
            //     _buildDetailItem('Jumlah Peserta', data['jumlah_peserta_mandiri'] ?? '0'),
            //   ]),
            //   ]),
              
            //   // Paket Koperasi Section
            //   _buildSection('Koperasi Berbadan Hukum', [
            //     _buildDetailItem('Jumlah kelompok', data['jumlah_kelompok_hukum'] ?? '0'),
            //     _buildDetailItem('Jumlah Peserta', data['jumlah_peserta_hukum'] ?? '0'),
            //   ]),
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
                      await uploadController.submitKelestarianData(
                        idUser: data['id_user'] , 
                        jamban: data['jamban'] , 
                        spal: data['spal'] , 
                        tps: data['tps'] , 
                        mck: data['mck'] , 
                        pdam: data['pdam'] , 
                        sumur: data['sumur'] , 
                        lainnya: data['dll'] , 
                        idRole: data['id_role'] , 
                        idOrganization: data['id_organization'] ,
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