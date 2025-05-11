import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class UploadGaleriPage extends StatefulWidget {
  const UploadGaleriPage({Key? key}) : super(key: key);

  @override
  State<UploadGaleriPage> createState() => _UploadGaleriPageState();
}

class _UploadGaleriPageState extends State<UploadGaleriPage> {
  final TextEditingController _namaKegiatanController = TextEditingController();
  final TextEditingController _tanggalKegiatanController = TextEditingController();
  File? _image;
  final _picker = ImagePicker();

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
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _tanggalKegiatanController.text = 
            DateFormat('dd-MM-yyyy').format(picked);
      });
    }
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Sumber Gambar'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Kamera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeri'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPrimary(
        title: 'Upload Galeri',
        onBack: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image picker section
            GestureDetector(
              onTap: _showImageSourceDialog,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_photo_alternate,
                            size: 50,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Pilih Gambar',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Nama Kegiatan input
            TextField(
              controller: _namaKegiatanController,
              decoration: InputDecoration(
                labelText: 'Nama Kegiatan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 16),
            
            // Tanggal Kegiatan input
            GestureDetector(
              onTap: _selectDate,
              child: AbsorbPointer(
                child: TextField(
                  controller: _tanggalKegiatanController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Kegiatan',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    suffixIcon: const Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ButtonFill(
          text: 'Upload',
          textColor: Colors.white,
          onPressed: () {
            // Implement your upload logic here
            if (_image == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pilih gambar terlebih dahulu')),
              );
              return;
            }
            if (_namaKegiatanController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Masukkan nama kegiatan')),
              );
              return;
            }
            if (_tanggalKegiatanController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Pilih tanggal kegiatan')),
              );
              return;
            }
            // Proceed with upload
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaKegiatanController.dispose();
    _tanggalKegiatanController.dispose();
    super.dispose();
  }
}