import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/_core/component/button/button_fill.dart';
import 'package:e_pkk_nganjuk/get/controller/galeri_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

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
      _bidangList = ['Kader Pokja 1', 'Penghayatan & Pengamalan Pancasila', 'Gotong Royong'];
    } else if (id_organization == '2') {
      _bidangList = ['Pendidikan & Ketrampilan', 'Pengembangan Kehidupan Berkoperasi'];
    } else if (id_organization == '3') {
      _bidangList = ['Kader Pokja 3', 'Program Pangan', 'Program Sandang', 'Program Perumahan & Tata Laksana Rumah Tangga'];
    } else if (id_organization == '4') {
      _bidangList = ['Kader Pokja 4', 'Kesehatan', 'Kelestarian Lingkungan Hidup', 'Perencanaan Sehat'];
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
      Get.snackbar('Error', 'Gagal memilih gambar');
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

  Future<void> _submitData() async {
    if (!_formKey.currentState!.validate()) return;
    if (_image == null) {
      Get.snackbar('Error', 'Pilih gambar terlebih dahulu');
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
        Get.snackbar('Sukses', 'Data berhasil diupload');
        _resetForm();
      }
    } catch (e) {
      Get.snackbar('Error', _controller.errorMessage.value);
    }
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
      appBar: AppBarPrimary(
        title: 'Upload Galeri',
        onBack: () => Get.back(),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Image Upload Section
                GestureDetector(
                  onTap: _showImageSourceDialog,
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover)
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.add_a_photo, size: 50),
                              Text('Tambahkan Foto'),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 20),

                // Nama Kegiatan
                TextFormField(
                  controller: _namaKegiatanController,
                  decoration: const InputDecoration(
                    labelText: 'Nama Kegiatan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) => value!.isEmpty 
                      ? 'Harap isi nama kegiatan' 
                      : null,
                ),
                const SizedBox(height: 20),

                // Bidang Dropdown
                DropdownButtonFormField<String>(
                  value: _selectedBidang,
                  decoration: const InputDecoration(
                    labelText: 'Bidang',
                    border: OutlineInputBorder(),
                  ),
                  items: _bidangList.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(() => _selectedBidang = value),
                  validator: (value) => value == null 
                      ? 'Pilih bidang' 
                      : null,
                ),
              ],
            ),
          ),
        ),
      
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(() {
          return ButtonFill(
            text: _controller.isLoading.value ? 'Mengunggah...' : 'Upload',
            textColor: Colors.white,
            onPressed: _controller.isLoading.value ? null : _submitData,
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _namaKegiatanController.dispose();
    super.dispose();
  }
}