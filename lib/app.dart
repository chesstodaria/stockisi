import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/repositories/repositories.dart';
import 'screens/app_routes.dart';
import 'services/scan_launcher.dart';
import 'services/session_controller.dart';
import 'theme/app_theme.dart';

/// Root widget Stockisi.
///
/// Setiap repository didaftarkan sebagai `Provider<Kontrak>.value`, jadi
/// layar hanya mengenal tipe abstrak (`context.read<AuthRepository>()`)
/// dan tidak tahu apakah datanya dari mock atau Supabase.
/// [SessionController] memakai `ChangeNotifierProvider` karena statusnya
/// berubah saat login dan logout.
class StockisiApp extends StatelessWidget {
  final Repositories repositories;

  /// Cara membuka pemindai QR. Test mengganti ini dengan pemindai palsu.
  final ScanLauncher scanLauncher;

  const StockisiApp({
    super.key,
    required this.repositories,
    this.scanLauncher = launchCameraScanner,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>.value(value: repositories.auth),
        Provider<ReferenceDocumentRepository>.value(
            value: repositories.documents),
        Provider<DraftRepository>.value(value: repositories.drafts),
        Provider<TransactionRepository>.value(
            value: repositories.transactions),
        Provider<StockCardRepository>.value(value: repositories.stockCard),
        Provider<ScanLauncher>.value(value: scanLauncher),
        ChangeNotifierProvider<SessionController>(
          create: (_) => SessionController(repositories.auth),
        ),
      ],
      child: MaterialApp(
        title: 'Stockisi',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light(),
        locale: const Locale('id'),
        supportedLocales: const [Locale('id')],
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        initialRoute: AppRoutes.splash,
        onGenerateInitialRoutes: AppRoutes.onGenerateInitialRoutes,
        onGenerateRoute: AppRoutes.onGenerateRoute,
      ),
    );
  }
}
