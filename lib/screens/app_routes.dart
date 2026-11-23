import 'package:flutter/material.dart';

import '../services/scan_launcher.dart';
import '../viewmodels/transaction_view_model.dart';
import 'documents/scanner_screen.dart';
import 'documents/transaction_detail_screen.dart';
import 'documents/transaction_summary_screen.dart';
import 'history/history_detail_screen.dart';
import 'home_shell.dart';
import 'login_screen.dart';
import 'session_guard.dart';
import 'splash_screen.dart';
import 'stock/qr_label_screen.dart';
import 'stock/stock_card_detail_screen.dart';

/// Semua rute bernama Stockisi (peta navigasi laporan bagian 2.4).
///
/// Nama rute berbahasa Indonesia karena tampil sebagai URL di web.
/// Aturan yang ditegakkan di sini:
/// * Setiap rute selain Splash dan Login dibungkus [SessionGuard], jadi
///   link web yang dibuka tanpa sesi berakhir di Login.
/// * Rute yang tidak dikenal atau argumennya tidak lengkap (misalnya URL
///   `/dokumen/detail` tanpa nomor dokumen) diulang dari Splash, tidak
///   crash.
/// * App selalu mulai dari Splash, apa pun URL awalnya, supaya sesi
///   diperiksa dulu.
abstract final class AppRoutes {
  static const splash = '/';
  static const login = '/masuk';

  /// Halaman utama berisi empat tab (layar 3).
  static const home = '/beranda';

  /// Argumen: nomor dokumen (`String`).
  static const transactionDetail = '/dokumen/detail';

  /// Argumen: `TransactionViewModel` milik Detail Transaksi, supaya draf
  /// yang sama dipakai di Ringkasan.
  static const transactionSummary = '/dokumen/ringkasan';

  /// Mengembalikan `ScanOutcome?` saat ditutup.
  static const scanner = '/dokumen/scan';

  /// Argumen: kode barang (`String`).
  static const stockCardDetail = '/kartu-stok/detail';

  /// Argumen: kode barang (`String`).
  static const qrLabel = '/kartu-stok/label-qr';

  /// Argumen: nomor transaksi (`String`).
  static const historyDetail = '/riwayat/detail';

  static List<Route<dynamic>> onGenerateInitialRoutes(String _) => [
        _page(const RouteSettings(name: splash), const SplashScreen()),
      ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splash:
        return _page(settings, const SplashScreen());
      case login:
        return _page(settings, const LoginScreen());
      case home:
        return _guarded(settings, const HomeShell());
      case transactionDetail when args is String:
        return _guarded(
            settings, TransactionDetailScreen(documentNumber: args));
      case transactionSummary when args is TransactionViewModel:
        return _guarded(settings, TransactionSummaryScreen(viewModel: args));
      case scanner:
        // Bertipe ScanOutcome? supaya `pushNamed<ScanOutcome?>` tidak gagal
        // cast dari Route<dynamic>.
        return MaterialPageRoute<ScanOutcome?>(
          settings: settings,
          fullscreenDialog: true,
          builder: (_) => const SessionGuard(
            redirectTo: login,
            child: ScannerScreen(),
          ),
        );
      case stockCardDetail when args is String:
        return _guarded(settings, StockCardDetailScreen(itemCode: args));
      case qrLabel when args is String:
        return _guarded(settings, QrLabelScreen(itemCode: args));
      case historyDetail when args is String:
        return _guarded(
            settings, HistoryDetailScreen(transactionNumber: args));
      default:
        // Rute tidak dikenal, atau rute dikenal tanpa argumen yang benar.
        // Tanpa sesi tetap berakhir di Login lewat Splash.
        return _page(settings, const RestartFromSplash(splashRoute: splash));
    }
  }

  static Route<dynamic> _page(RouteSettings settings, Widget child) =>
      MaterialPageRoute<dynamic>(settings: settings, builder: (_) => child);

  static Route<dynamic> _guarded(RouteSettings settings, Widget child) =>
      _page(settings, SessionGuard(redirectTo: login, child: child));
}
