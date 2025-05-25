import 'dart:async';
import 'dart:io';

import 'package:e_pkk_nganjuk/usecases/pengumuman_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_pkk_nganjuk/features/home/data/model/pengumuman_model.dart';

class PengumumanController extends GetxController {
  final GetPengumumanUsecase getPengumumanUsecase;
  
  // List Observables
  var pengumumanList = <Pengumuman>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  var hasMore = true.obs;
  var isLoadMore = false.obs;
  var latestPengumumanList = <Pengumuman>[].obs;

  PengumumanController({required this.getPengumumanUsecase});

  Future<void> loadLatestPengumuman({int limit = 5}) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      
      final response = await getPengumumanUsecase.execute(limit: limit);
      
      if (response.statusCode == 200) {
        latestPengumumanList.assignAll(response.data);
        print('Berhasil memuat ${latestPengumumanList.length} pengumuman terbaru');
      } else {
        errorMessage.value = response.message;
      }
    } catch (e) {
      errorMessage.value = 'Gagal memuat pengumuman terbaru: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadPengumuman({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        currentPage.value = 1;
        pengumumanList.clear();
        hasMore.value = true;
        isLoading.value = true;
      } else if (!hasMore.value || isLoadMore.value) {
        return;
      }

      isLoadMore.value = !isRefresh;
      errorMessage.value = '';

      final response = await getPengumumanUsecase.execute(
        page: currentPage.value,
        limit: 10, // Tambahkan parameter limit
      );

      if (response.statusCode == 200) {
        final newData = response.data;
        if (newData.isNotEmpty) {
          if (isRefresh) {
            pengumumanList.assignAll(newData);
          } else {
            pengumumanList.addAll(newData);
          }

          currentPage.value++;
          totalPages.value = response.pagination?.totalHalaman ?? 1;
          hasMore.value = currentPage.value <= totalPages.value;
          
          debugPrint('Berhasil memuat ${newData.length} pengumuman');
        } else {
          hasMore.value = false;
        }
      } else {
        errorMessage.value = response.message ?? 'Gagal memuat pengumuman';
      }
    } on SocketException {
      errorMessage.value = 'Tidak ada koneksi internet';
    } on TimeoutException {
      errorMessage.value = 'Server tidak merespons';
    } catch (e) {
      errorMessage.value = 'Gagal memuat pengumuman: ${e.toString()}';
      debugPrint('Error: $e');
    } finally {
      isLoading.value = false;
      isLoadMore.value = false;
    }
  }
  
  Future<void> loadMore() async {
    if (hasMore.value && !isLoadMore.value) {
      isLoadMore.value = true;
      await loadPengumuman();
    }
  }
  
  Future<void> refreshData() async {
    await loadPengumuman(isRefresh: true);
  }

  // Optional: Sorting dari terbaru
  void sortByNewest() {
    pengumumanList.sort((a, b) => b.tanggal.compareTo(a.tanggal));
  }
}