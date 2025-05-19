import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_pkk_nganjuk/get/controller/profil_controller.dart';

class EditPasswordScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _currentPassController = TextEditingController();
  final _newPassController = TextEditingController();
  final _confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ProfilController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text('Ubah Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _currentPassController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Saat Ini',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Harus diisi' : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _newPassController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password Baru',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Harus diisi';
                  if (value.length < 6) return 'Minimal 6 karakter';
                  return null;
                },
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: _confirmPassController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password Baru',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return 'Harus diisi';
                  if (value != _newPassController.text) return 'Password tidak sama';
                  return null;
                },
              ),
              SizedBox(height: 24),
              Obx(() {
                if (controller.isUpdating.value) {
                  return CircularProgressIndicator();
                }
                
                return ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final success = await controller.updatePassword(
                        currentPassword: _currentPassController.text,
                        newPassword: _newPassController.text,
                      );
                      
                      if (success) {
                        Get.back();
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text('SIMPAN PASSWORD BARU'),
                );
              }),
              if (controller.errorMessage.value.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    controller.errorMessage.value,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}