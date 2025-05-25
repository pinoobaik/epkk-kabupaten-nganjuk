import 'package:e_pkk_nganjuk/_core/component/appbar/custome_appbar.dart';
import 'package:e_pkk_nganjuk/features/home/data/model/pengumuman_model.dart';
import 'package:e_pkk_nganjuk/features/home/presentation/components/card_pengumuman.dart';
import 'package:e_pkk_nganjuk/get/controller/nav_controller.dart';
import 'package:e_pkk_nganjuk/get/controller/pengumuman_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PengumumanScreen extends StatefulWidget {
  const PengumumanScreen({super.key});

  @override
  State<PengumumanScreen> createState() => _PengumumanScreenState();
}

class _PengumumanScreenState extends State<PengumumanScreen> {
  final PengumumanController pengumumanController = Get.find<PengumumanController>();
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadInitialData();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _loadInitialData() async {
    await pengumumanController.loadPengumuman(isRefresh: true);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _loadMoreData();
    }
  }

  Future<void> _loadMoreData() async {
    if (!pengumumanController.isLoadMore.value && pengumumanController.hasMore.value) {
      await pengumumanController.loadPengumuman();
    }
  }

  Future<void> _onRefresh() async {
    try {
      await pengumumanController.refreshData();
      _refreshController.refreshCompleted();
    } catch (e) {
      _refreshController.refreshFailed();
    }
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
          navController.changeTabIndex(0);
          Get.back();
        },
      ),
      body: SmartRefresher(
        controller: _refreshController,
        onRefresh: _onRefresh,
        enablePullDown: true,
        enablePullUp: pengumumanController.hasMore.value,
        onLoading: _loadMoreData,
        header: const ClassicHeader(
          idleText: 'Tarik untuk refresh',
          releaseText: 'Lepaskan untuk refresh',
          completeText: 'Refresh selesai',
        ),
        footer: CustomFooter(
          builder: (context, mode) {
            if (mode == LoadStatus.loading) {
              return const Padding(
                padding: EdgeInsets.all(8.0),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return const SizedBox();
          },
        ),
        child: Obx(() {
          if (pengumumanController.isLoading.value && pengumumanController.pengumumanList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (pengumumanController.errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    pengumumanController.errorMessage.value,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: _loadInitialData,
                    child: Text('Coba Lagi', style: TextStyle(fontSize: 14.sp)),
                  ),
                ],
              ),
            );
          }

          if (pengumumanController.pengumumanList.isEmpty) {
            return Center(
              child: Text(
                "Belum ada pengumuman",
                style: TextStyle(fontSize: 16.sp),
              ),
            );
          }

          return ListView.builder(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: pengumumanController.pengumumanList.length + (pengumumanController.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= pengumumanController.pengumumanList.length) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Center(
                    child: pengumumanController.isLoadMore.value
                        ? const CircularProgressIndicator()
                        : Text(
                            'Tarik untuk memuat lebih banyak',
                            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                  ),
                );
              }

              final pengumuman = pengumumanController.pengumumanList[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: CardPengumuman(
                  title: pengumuman.judul,
                  subTitle: pengumuman.tempat,
                  dateText: DateFormat('dd-MM-yyyy').format(pengumuman.tanggal),
                  onTab: () => _showPengumumanDetail(context, pengumuman),
                ),
              );
            },
          );
        }),
      ),
    );
  }

  void _showPengumumanDetail(BuildContext context, Pengumuman pengumuman) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: SingleChildScrollView(
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.close, size: 20.w),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Divider(thickness: 1, height: 1, color: Colors.grey[300]),
                  SizedBox(height: 12.h),
                  _buildDetailRow(icon: Icons.location_on, text: pengumuman.tempat),
                  SizedBox(height: 8.h),
                  _buildDetailRow(
                    icon: Icons.calendar_today,
                    text: DateFormat('dd MMMM yyyy').format(pengumuman.tanggal),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Deskripsi',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    child: SingleChildScrollView(
                      child: Text(
                        pengumuman.deskripsi ?? 'Tidak ada deskripsi',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Tutup',
                        style: TextStyle(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16.w, color: Colors.grey),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }
}