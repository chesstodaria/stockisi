import 'package:flutter/material.dart';

import '../data/transaction_rules.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Chip status item: Pending, Partial, Complete, atau Sudah terpenuhi.
///
/// Status dibedakan dengan ikon dan teks, bukan warna saja, supaya tetap
/// terbaca oleh operator dengan buta warna.
class ItemStatusChip extends StatelessWidget {
  final ItemStatus status;

  const ItemStatusChip(this.status, {super.key});

  static (Color fg, Color bg, IconData icon) _styleOf(ItemStatus s) =>
      switch (s) {
        ItemStatus.pending => (
            AppColors.pendingFg,
            AppColors.pendingBg,
            Icons.radio_button_unchecked_rounded,
          ),
        ItemStatus.partial => (
            AppColors.partialFg,
            AppColors.partialBg,
            Icons.timelapse_rounded,
          ),
        ItemStatus.complete => (
            AppColors.completeFg,
            AppColors.completeBg,
            Icons.check_circle_rounded,
          ),
        ItemStatus.fulfilled => (
            AppColors.fulfilledFg,
            AppColors.fulfilledBg,
            Icons.done_all_rounded,
          ),
      };

  @override
  Widget build(BuildContext context) {
    final (fg, bg, icon) = _styleOf(status);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSpace.sm, vertical: AppSpace.xs - 1),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: fg),
          const SizedBox(width: AppSpace.xs),
          Text(status.label, style: AppTextStyles.chip.copyWith(color: fg)),
        ],
      ),
    );
  }
}
