import 'package:flutter/material.dart';

import '../models/document_type.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Badge warna yang membedakan RCV (hijau, barang masuk) dan INT (oranye,
/// barang keluar), dipakai di daftar dokumen, riwayat, dan mutasi stok.
///
/// Default menampilkan kode (`RCV`); [showLabel] menampilkan nama lengkap
/// (`Receiving`).
class DocumentTypeBadge extends StatelessWidget {
  final DocumentType type;
  final bool showLabel;

  const DocumentTypeBadge(this.type, {super.key, this.showLabel = false});

  static Color background(DocumentType type) => switch (type) {
        DocumentType.receiving => AppColors.receivingBg,
        DocumentType.intransit => AppColors.intransitBg,
      };

  static Color foreground(DocumentType type) => switch (type) {
        DocumentType.receiving => AppColors.receivingFg,
        DocumentType.intransit => AppColors.intransitFg,
      };

  /// Panah masuk untuk RCV, panah keluar untuk INT.
  static IconData icon(DocumentType type) => switch (type) {
        DocumentType.receiving => Icons.south_west_rounded,
        DocumentType.intransit => Icons.north_east_rounded,
      };

  @override
  Widget build(BuildContext context) {
    final fg = foreground(type);
    final text = showLabel ? type.label : type.code;
    return Semantics(
      label: type.label,
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: AppSpace.sm, vertical: AppSpace.xs - 1),
        decoration: BoxDecoration(
          color: background(type),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon(type), size: 12, color: fg),
            const SizedBox(width: AppSpace.xs),
            Text(text, style: AppTextStyles.chip.copyWith(color: fg)),
          ],
        ),
      ),
    );
  }
}
