import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/_core/component/form/input_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_pkk_nganjuk/get/controller/profil_controller.dart';
import 'package:e_pkk_nganjuk/commons/constants/colors.dart';

class InfoAkunScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ProfilController controller = Get.find();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _nameController.text = controller.profilData.value.fullName;
      _phoneController.text = controller.profilData.value.phoneNumber;
    });

    return Scaffold(
      backgroundColor: TextColors.grey50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: TextColors.grey700),
        title: Text(
          'Informasi Akun',
          style: TextStyle(
            color: TextColors.grey900,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: TextColors.grey700),
            onPressed: () => controller.loadProfil(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator(color: BrandColors.brandPrimary500));
        }

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                InputFormField(
                  controller: _nameController,
                  label: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap',
                  validator: (value) => value == null || value.isEmpty ? 'Harus diisi' : null,
                ),
                SizedBox(height: 16.h),
                InputFormField(
                  controller: _phoneController,
                  label: 'Nomor HP',
                  hintText: 'Masukkan nomor HP',
                  validator: (value) => value == null || value.isEmpty ? 'Harus diisi' : null,
                ),
                SizedBox(height: 32.h),
                ButtonFill(
                  text: 'Simpan Perubahan',
                  textColor: Colors.white,
                  isLoading: controller.isUpdating.value,
                  onPressed: controller.isUpdating.value
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await controller.updateProfileInfo(
                              fullName: _nameController.text,
                              phoneNumber: _phoneController.text,
                            );
                            if (success) {
                              _formKey.currentState!.save();
                              Get.snackbar(
                                'Sukses',
                                'Data profil berhasil diperbarui',
                                backgroundColor: Colors.green.shade50,
                                colorText: Colors.green.shade800,
                                snackPosition: SnackPosition.TOP,
                              );
                            }
                          }
                        },
                ),
                if (controller.errorMessage.value.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.red, fontSize: 14.sp),
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
