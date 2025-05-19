import 'package:e_pkk_nganjuk/commons/constants/colors.dart';
import 'package:e_pkk_nganjuk/commons/constants/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

// ... (import tetap sama)

class CardLaporan extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String dateText;
  final VoidCallback onTab;

  CardLaporan({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.dateText,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomTapAnimation(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
          color: TextColors.grey50,
          border: Border.all(
            color: TextColors.grey200,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Kiri (judul, subjudul, tanggal)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TypographyStyles.captionBold(
                      title,
                      color: TextColors.grey700,
                      overflow: TextOverflow.ellipsis,
                      maxlines: 1,
                    ),
                    SizedBox(height: 2.h),
                    TypographyStyles.bodyCaptionSmallBold(
                      subtitle,
                      color: TextColors.grey500,
                      overflow: TextOverflow.ellipsis,
                      maxlines: 2,
                    ),
                    SizedBox(height: 8.h),
                    TypographyStyles.captionMedium(
                      dateText,
                      color: BrandColors.brandPrimary500,
                      overflow: TextOverflow.ellipsis,
                      maxlines: 1,
                    ),
                  ],
                ),
              ),

              SizedBox(width: 8.w), // spaceBetween dengan jarak manual

              // Kanan (status)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: getStatusColor(status),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: getStatusTextColor(status),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'sedang diproses':
      return Colors.orange.shade100;
    case 'revisi':
      return Colors.red.shade100;
    case 'disetujui kecamatan':
      return Colors.green.shade100;
    case 'disetujui kabupaten':
      return Colors.green.shade100;
    default:
      return Colors.grey.shade200;
  }
}

Color getStatusTextColor(String status) {
  switch (status.toLowerCase()) {
    case 'sedang diproses':
      return Colors.orange.shade800;
    case 'revisi':
      return Colors.red.shade800;
    case 'disetujui kecamatan':
      return Colors.green.shade800;
    case 'disetujui kabupaten':
      return Colors.green.shade800;
    default:
      return Colors.grey.shade600;
  }
}

String getSubtitleFromUUID(String uuid) {
  final prefix = uuid.split('-').first;

  switch (prefix) {
    case 'KP1':
      return 'Kader Pokja I';
    case 'KP1B1':
      return 'Penghayatan dan Pengamalan Pancasila';
    case 'KP1B2':
      return 'Gotong Royong';
    case 'KP2B1':
      return 'Pendidikan Ketrampilan';
    case 'KP2B2':
      return 'Pengembangan Kehidupan Berkoperasi';
    case 'KP3':
      return 'Kader Pokja II';
    case 'KP3B1':
      return 'Pangan';
    case 'KP3B2':
      return 'Sandang';
    case 'KP3B3':
      return 'Perumahan dan Tata Laksana Rumah Tangga';
    case 'KP4':
      return 'Kader Pokja IV';
    case 'KP4B1':
      return 'Kesehatan';
    case 'KP4B2':
      return 'Kelestarian Lingkungan Hidup';
    case 'KP4B3':
      return 'Perencanaan Sehat';
    case 'PKKUM':
      return 'Laporan Umum';
    default:
      return 'Kategori Tidak Dikenal';
  }
}

