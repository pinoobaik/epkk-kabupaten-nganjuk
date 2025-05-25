import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/card_pengumuman.dart';
import 'package:e_pkk_nganjuk/get/controller/nav_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pengumuman_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class PengumumanScreen extends StatefulWidget {
  const PengumumanScreen({super.key});

  @override
  State<PengumumanScreen> createState() => _PengumumanScreenState();
}

  
class _PengumumanScreenState extends State<PengumumanScreen> {
  final PengumumanController pengumumanController = Get.find<PengumumanController>();

  @override
  void initState() {
    super.initState();
    pengumumanController.loadPengumuman(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarPrimary(
        title: 'Pengumuman',
        backgroundColor: Colors.white,
        onBack: () {
          final NavController navController = Get.find<NavController>();
          navController.changeTabIndex(0); // ganti ke tab "Beranda" (index ke-0)
          Get.back(); // kembali ke MainScreen
        },
      ),
      
      
      body: Obx(() {
        const Divider(height: 1);
        if (pengumumanController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (pengumumanController.errorMessage.isNotEmpty) {
          return Center(child: Text(pengumumanController.errorMessage.value));
        }

        if (pengumumanController.pengumumanList.isEmpty) {
          return const Center(child: Text("Belum ada pengumuman."));
        }
        
        return ListView.builder(
          padding: EdgeInsets.only(top: 16.h),
          itemCount: pengumumanController.pengumumanList.length,
          itemBuilder: (context, index) {
          final pengumuman = pengumumanController.pengumumanList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: CardPengumuman(
                title: pengumuman.judul,
                subTitle: pengumuman.tempat,
                dateText: DateFormat('dd-MM-yyyy').format(pengumuman.tanggal),
                onTab: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      pengumuman.judul,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.close, size: 24.w),
                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Divider(color: Colors.grey[300], thickness: 1),
                              SizedBox(height: 12.h),
                              Row(
                                children: [
                                  Icon(Icons.location_on, size: 18.w, color: Colors.grey),
                                  SizedBox(width: 8.w),
                                  Text(
                                    pengumuman.tempat,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 18.w, color: Colors.grey),
                                  SizedBox(width: 8.w),
                                  Text(
                                    DateFormat('dd MMMM yyyy').format(pengumuman.tanggal),
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Text(
                                'Deskripsi',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Container(
                                constraints: BoxConstraints(
                                  maxHeight: MediaQuery.of(context).size.height * 0.4,
                                ),
                                child: SingleChildScrollView(
                                  child: Text(
                                    pengumuman.deskripsi ?? 'Tidak ada deskripsi',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey[800],
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 12.h),
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'Tutup',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },

              ),
            );
          },
        );
      }),
    );
  }
}
