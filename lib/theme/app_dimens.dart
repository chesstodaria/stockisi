/// Jarak, radius, dan ukuran yang dipakai seluruh layar.
///
/// Semua berupa `static const double` supaya bisa dipakai di dalam widget
/// `const` (misalnya `const SizedBox(height: AppSpace.sm)`).
library;

/// Skala jarak 4 pt.
abstract final class AppSpace {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;

  /// Padding tepi layar.
  static const double screen = 16;
}

abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;

  /// Badge dan chip berbentuk kapsul.
  static const double pill = 999;
}

abstract final class AppSize {
  /// Target sentuh minimum (Material: 48 dp). Operator gudang sering
  /// memakai sarung tangan.
  static const double minTouch = 48;

  /// Tinggi tombol aksi utama di bagian bawah layar.
  static const double primaryButton = 52;

  static const double iconSm = 16;
  static const double iconMd = 24;
  static const double iconLg = 48;
}
