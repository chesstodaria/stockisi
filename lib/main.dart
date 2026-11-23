import 'package:flutter/material.dart';

import 'app.dart';
import 'data/mock/mock_repositories.dart';
import 'data/mock/mock_seed.dart';
import 'services/session_store.dart';

/// Titik komposisi: satu-satunya tempat yang memilih implementasi
/// repository. Untuk pindah ke Supabase, ganti dua pernyataan di bawah
/// dengan `Repositories` berisi lima kelas Supabase (laporan bagian 3.4).
///
/// Coba kondisi gagal tanpa mengubah kode:
/// `flutter run -d chrome --dart-define=STOCKISI_MOCK_FAIL=login,documents`
void main() {
  final backend = createSeededBackend(failOnce: mockFailuresFromEnvironment());
  runApp(StockisiApp(
    repositories:
        createMockRepositories(backend, sessionStore: SecureSessionStore()),
  ));
}
