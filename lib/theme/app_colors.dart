import 'package:flutter/material.dart';

/// Satu-satunya sumber warna Stockisi.
///
/// Setiap pasangan teks/latar yang dipakai layar sudah dicek minimal
/// WCAG AA 4,5:1 di `test/theme_contrast_test.dart`. Kalau menambah atau
/// mengganti warna, tambahkan pasangannya ke test itu.
abstract final class AppColors {
  // ------------------------------------------------------------ merek
  /// Warna utama: app bar, tombol utama, indikator tab aktif.
  static const navy = Color(0xFF1E2A5E);

  /// Teks dan ikon di atas [navy].
  static const onNavy = Color(0xFFFFFFFF);

  // ------------------------------------------------------------ permukaan
  /// Latar halaman (krem lembut, sesuai rancangan bagian 2.6).
  static const background = Color(0xFFF8F5EF);

  /// Kartu, lembar bawah, dialog, kolom isian.
  static const surface = Color(0xFFFFFFFF);

  /// Blok informasi sekunder, misalnya saldo stok dan kartu dokumen selesai.
  static const surfaceMuted = Color(0xFFEFEBE3);

  /// Garis tepi kartu, pemisah, dan kolom isian.
  static const border = Color(0xFFE1DCD2);

  // ------------------------------------------------------------ teks
  static const textPrimary = Color(0xFF1A2140);
  static const textSecondary = Color(0xFF585F6E);

  // ------------------------------------------------------------ jenis dokumen
  /// Receiving (RCV): hijau, barang masuk.
  static const receivingFg = Color(0xFF1C6B3A);
  static const receivingBg = Color(0xFFDDF0E3);

  /// Intransit (INT): oranye, barang keluar.
  static const intransitFg = Color(0xFF9A4510);
  static const intransitBg = Color(0xFFFCE7D6);

  // ------------------------------------------------------------ status item
  static const pendingFg = Color(0xFF4A5163);
  static const pendingBg = Color(0xFFECEEF2);

  static const partialFg = Color(0xFF7A5700);
  static const partialBg = Color(0xFFFDF0C8);

  static const completeFg = Color(0xFF1C6B3A);
  static const completeBg = Color(0xFFDDF0E3);

  /// "Sudah terpenuhi": sisa nol sejak transaksi Partial sebelumnya.
  static const fulfilledFg = Color(0xFF345878);
  static const fulfilledBg = Color(0xFFE2EBF4);

  // ------------------------------------------------------------ kesalahan
  /// Teks/ikon kesalahan di atas [surface] atau [background], misalnya
  /// tombol Logout dan aksi "Tandai tidak tersedia".
  static const error = Color(0xFFB0261E);

  /// Banner kesalahan di dalam form.
  static const errorFg = Color(0xFF9E241C);
  static const errorBg = Color(0xFFFBE4E2);
}
