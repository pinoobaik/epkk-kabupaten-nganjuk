import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:e_pkk_nganjuk/get/controller/pendidikan_keterampilan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class PendidikanKetrampilan5Screen extends StatefulWidget {
  const PendidikanKetrampilan5Screen({super.key});

  @override
  State<PendidikanKetrampilan5Screen> createState() => _PendidikanKetrampilan5ScreenState();
}

class _PendidikanKetrampilan5ScreenState extends State<PendidikanKetrampilan5Screen> {
  final PendidikanKeterampilanController uploadController = Get.find<PendidikanKeterampilanController>();
  
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
        title: 'Review Laporan',
        currentStep: 5,
        totalSteps: 5,
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
              _buildDetailItem('Jumlah Warga yang masih buta huruf', data['warga_buta'] ?? '0'),

              // Paket A Section
              _buildSection('Paket A', [
                _buildDetailItem('Kel. Belajar', data['kel_belajarA'] ?? '0'),
                _buildDetailItem('Warga Belajar', data['warga_belajarA'] ?? '0'),
              ]),

              // Paket B Section
              _buildSection('Paket B', [
                _buildDetailItem('Kel. Belajar', data['kel_belajarB'] ?? '0'),
                _buildDetailItem('Warga Belajar', data['warga_belajarB'] ?? '0'),
              ]),

              // Paket C Section
              _buildSection('Paket C', [
                _buildDetailItem('Kel. Belajar', data['kel_belajarC'] ?? '0'),
                _buildDetailItem('Warga Belajar', data['warga_belajarC'] ?? '0'),
              ]),

              // Paket KF Section
              _buildSection('Paket KF', [
                _buildDetailItem('Kel. Belajar', data['kel_belajarKF'] ?? '0'),
                _buildDetailItem('Warga Belajar', data['warga_belajarKF'] ?? '0'),
              ]),

              // PAUD Section
              _buildDetailItem('Paud / sejenis', data['paud'] ?? '0'),
              _buildDetailItem('Jumlah taman bacaan / perpustakaan', data['taman_bacaan'] ?? '0'),

              // BKP Section
              _buildSection('BKP', [
                _buildDetailItem('Jumlah KLP', data['jumlah_klp'] ?? '0'),
                _buildDetailItem('Jumlah Ibu peserta', data['jumlah_ibu_peserta'] ?? '0'),
                _buildDetailItem('Jumlah APE (SET)', data['jumlah_ape'] ?? '0'),
                _buildDetailItem('Jumlah Kel. Simulasi', data['jumlah_kel_simulasi'] ?? '0'),
              ]),

              // Kader Khusus Section
              _buildSection('Kader Khusus', [
                _buildDetailItem('KF', data['KF'] ?? '0'),
                _buildDetailItem('Paud / sejenis', data['paud_tutor'] ?? '0'),
                _buildDetailItem('BKP', data['BKB'] ?? '0'),
                _buildDetailItem('Koperasi', data['koperasi'] ?? '0'),
                _buildDetailItem('Ketrampilan', data['ketrampilan'] ?? '0'),
              ]),

              // Jumlah Kader yang Sudah Dilatih Section
              _buildSection('Jumlah Kader yang Sudah Dilatih', [
                _buildDetailItem('LP3PKK', data['LP3PKK'] ?? '0'),
                _buildDetailItem('TP3PKK', data['TP3PKK'] ?? '0'),
                _buildDetailItem('DAMAS PKK', data['damas_pkk'] ?? '0'),
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
                      await uploadController.submitPendidikanKeterampilan(
                        idUser: data['id_user'] ,
                        wargaButa: data['warga_buta'] , 
                        kelBelajarA: data['kel_belajarA'] , 
                        wargaBelajarA: data['warga_belajarA'] , 
                        kelBelajarB: data['kel_belajarB'] , 
                        wargaBelajarB: data['warga_belajarB'] , 
                        kelBelajarC: data['kel_belajarC'] , 
                        wargaBelajarC: data['warga_belajarC'] , 
                        kelBelajarKF: data['kel_belajarKF'] , 
                        wargaBelajarKF: data['warga_belajarKF'] , 
                        paud: data['paud'] ,
                        tamanBacaan: data['taman_bacaan'] , 
                        jumlahKlp: data['jumlah_klp'] , 
                        jumlahLbuPeserta: data['jumlah_ibu_peserta'] , 
                        jumlahApe: data['jumlah_ape'] , 
                        jumlahKelSimulasi: data['jumlah_kel_simulasi'] , 
                        kf: data['KF'] , 
                        paudTutor: data['paud_tutor'] , 
                        bkb: data['BKB'] , 
                        koperasi: data['koperasi'] , 
                        ketrampilan: data['ketrampilan'] , 
                        lp3pkk: data['LP3PKK'] , 
                        tp3pkk: data['TP3PKK'] , 
                        damasPkk: data['damas_pkk'] , 
                        idRole: data['id_role'] , 
                        idOrganization: data['id_organization'] 
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