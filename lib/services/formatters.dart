/// Format angka dan tanggal untuk tampilan, gaya Indonesia.
///
/// Nama bulan ditulis langsung (bukan lewat `DateFormat` locale `id`)
/// supaya hasilnya sama di app, widget test, dan unit test tanpa perlu
/// `initializeDateFormatting`.
abstract final class Fmt {
  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun',
    'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des',
  ];

  /// Kuantitas dengan pemisah ribuan titik: `1200` → `1.200`,
  /// `-40` → `-40`.
  static String qty(int value) {
    final digits = value.abs().toString();
    final buffer = StringBuffer(value < 0 ? '-' : '');
    for (var i = 0; i < digits.length; i++) {
      if (i > 0 && (digits.length - i) % 3 == 0) buffer.write('.');
      buffer.write(digits[i]);
    }
    return buffer.toString();
  }

  /// Tanggal saja, misalnya `21 Nov 2026`.
  static String date(DateTime value) {
    final d = value.toLocal();
    return '${d.day} ${_months[d.month - 1]} ${d.year}';
  }

  /// Tanggal dan jam, misalnya `19 Nov 2026, 15.45` (jam memakai titik,
  /// sesuai kebiasaan penulisan waktu di Indonesia).
  static String dateTime(DateTime value) {
    final d = value.toLocal();
    final hh = d.hour.toString().padLeft(2, '0');
    final mm = d.minute.toString().padLeft(2, '0');
    return '${date(d)}, $hh.$mm';
  }
}
