import 'dart:async';

import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/drop_down.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/get/controller/galeri_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class UploadGaleriPage extends StatefulWidget {
  const UploadGaleriPage({Key? key}) : super(key: key);

  @override
  State<UploadGaleriPage> createState() => _UploadGaleriPageState();
}

class _UploadGaleriPageState extends State<UploadGaleriPage> {
  final GaleriController _controller = Get.find<GaleriController>();
  final TextEditingController _namaKegiatanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _image;
  final _picker = ImagePicker();
  String? _selectedBidang;
  List<String> _bidangList = [];

  String? id_user;
  String? id_role;
  String? id_organization;
  String? full_name;
  String? name_role;
  String? name_organization;

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

    _initializeBidangList();
  }

  void _initializeBidangList() {
    if (id_organization == '1') {
      _bidangList = ['Kader Pokja I', 'Penghayatan & Pengamalan Pancasila', 'Gotong Royong'];
    } else if (id_organization == '2') {
      _bidangList = ['Pendidikan & Ketrampilan', 'Pengembangan Kehidupan Berkoperasi'];
    } else if (id_organization == '3') {
      _bidangList = ['Kader Pokja III', 'Program Pangan', 'Program Sandang', 'Program Perumahan & Tata Laksana Rumah Tangga'];
    } else if (id_organization == '4') {
      _bidangList = ['Kader Pokja IV', 'Kesehatan', 'Kelestarian Lingkungan Hidup', 'Perencanaan Sehat'];
    } else if (id_organization == '5') {
      _bidangList = ['Laporan Umum'];
    } else {
      _bidangList = ['Bidang Tidak Ditemukan, Harap Login Ulang'];
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      _showErrorSnackbar('Gagal memilih gambar');
    }
  }

  void _showImageSourceDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Pilih Sumber Gambar', style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: TextColors.grey700,
        )),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.blue),
              title: Text('Kamera', style: TextStyle(
                fontSize: 14.sp,
                color: TextColors.grey700,
              )),
              onTap: () {
                Get.back();
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: Icon(Icons.photo_library, color: Colors.blue),
              title: Text('Galeri', style: TextStyle(
                fontSize: 14.sp,
                color: TextColors.grey700,
              )),
              onTap: () {
                Get.back();
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitData() async {
    if (!_formKey.currentState!.validate()) {
      _showErrorSnackbar('Form tidak valid! Mohon periksa kembali input Anda.');
      return;
    }
    if (_image == null) {
      _showErrorSnackbar('Pilih gambar terlebih dahulu');
      return;
    }

    try {
      await _controller.submitDataGaleri(
        idUser: id_user!,
        deskripsi: _namaKegiatanController.text,
        gambar: _image!.path,
        pokja: name_organization!,
        bidang: _selectedBidang!,
        idRole: id_role!,
        idOrganization: id_organization!,
      );

      if (_controller.galeriData.value != null) {
        Get.snackbar(
          'Berhasil',
          'Data berhasil diupload',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.shade50,
          colorText: Colors.green.shade800,
        );
        _resetForm();
      } else {
        _showErrorSnackbar(_controller.errorMessage.value.isNotEmpty
            ? _controller.errorMessage.value
            : 'Terjadi kesalahan saat mengupload');
      }
    } on SocketException {
      _showErrorSnackbar('Tidak ada koneksi internet. Silakan periksa koneksi Anda.');
    } on TimeoutException {
      _showErrorSnackbar('Server tidak merespons, coba lagi nanti.');
    } catch (e) {
      _showErrorSnackbar('Terjadi kesalahan yang tidak diketahui.');
    }
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red.shade50,
      colorText: Colors.red.shade800,
    );
  }

  void _resetForm() {
    _namaKegiatanController.clear();
    setState(() {
      _image = null;
      _selectedBidang = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPrimary(
        title: 'Upload Galeri',
        onBack: () {
          if (_namaKegiatanController.text.isEmpty && _image == null && _selectedBidang == null) {
            Get.back();
          } else {
            Get.defaultDialog(
              title: "Batal Upload?",
              middleText: "Data yang sudah diisi akan hilang",
              textConfirm: "Ya",
              textCancel: "Tidak",
              confirmTextColor: Colors.white,
              onConfirm: () {
                _resetForm();
                Get.back();
                Get.back();
              },
            );
          }
        },
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Image Upload Section
                ZoomTapAnimation(
                  onTap: _showImageSourceDialog,
                  child: Container(
                    height: 200.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: Image.file(_image!, fit: BoxFit.cover),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo, size: 50.sp, color: Colors.grey.shade500),
                              SizedBox(height: 8.h),
                              Text('Tambahkan Foto', style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey.shade600,
                              )),
                            ],
                          ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Nama Kegiatan
                InputFormField(
                  controller: _namaKegiatanController,
                  label: 'Nama Kegiatan',
                  hintText: 'Masukkan nama kegiatan',
                  validator: (value) => value!.isEmpty ? 'Harap isi nama kegiatan' : null,
                ),
                SizedBox(height: 24.h),

                // Bidang Dropdown
                DropdownComponent(
                  hintText: 'Pilih Bidang',
                  randomlabel: 'Bidang',
                  errorKosong: 'Pilih bidang',
                  svgIconPath: 'assets/icons/ic_user_tag.svg', // Update with your actual icon path
                  listItem: _bidangList,
                  onChanged: (value) {
                    setState(() {
                      _selectedBidang = value;
                    });
                  },
                  selectedValue: _selectedBidang,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: ZoomTapAnimation(
          child: Obx(
            () => ButtonFill(
              text: _controller.isLoading.value ? 'Mengunggah...' : 'UPLOAD',
              textColor: Colors.white,
              onPressed: _controller.isLoading.value ? null : _submitData,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaKegiatanController.dispose();
    super.dispose();
  }
}