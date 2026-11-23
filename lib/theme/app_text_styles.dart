import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Gaya teks Stockisi. Font Plus Jakarta Sans dibundel di `assets/fonts/`
/// (lisensi OFL), jadi tampilan sama di web dan Android tanpa unduhan.
abstract final class AppTextStyles {
  static const fontFamily = 'PlusJakartaSans';

  /// Judul halaman besar, misalnya "Masuk".
  static const headline = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 1.25,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  /// Judul app bar, nama barang, nomor dokumen.
  static const title = TextStyle(
    fontFamily: fontFamily,
    fontSize: 17,
    height: 1.3,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const bodyStrong = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const bodySecondary = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    height: 1.4,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  /// Label kecil di atas nilai, misalnya "Target" dan "Diinput".
  static const label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  /// Kode barang, nomor rak, nomor transaksi.
  static const code = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.3,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    color: AppColors.textSecondary,
  );

  /// Teks badge dan chip status.
  static const chip = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 1.2,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.3,
  );

  /// Angka kuantitas di daftar.
  static const quantity = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.2,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    fontFeatures: [FontFeature.tabularFigures()],
  );

  /// Angka besar, misalnya saldo stok fisik dan target item.
  static const quantityLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 1.1,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    fontFeatures: [FontFeature.tabularFigures()],
  );
}
