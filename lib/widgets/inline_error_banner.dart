import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Pesan kesalahan di dalam form atau di atas konten, misalnya login
/// ditolak atau Submit masih ada item Pending. Diumumkan ke pembaca layar
/// sebagai live region.
class InlineErrorBanner extends StatelessWidget {
  final String message;

  const InlineErrorBanner(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      liveRegion: true,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(AppSpace.md),
        decoration: BoxDecoration(
          color: AppColors.errorBg,
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.error_outline_rounded,
                size: 20, color: AppColors.errorFg),
            const SizedBox(width: AppSpace.sm),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.body.copyWith(color: AppColors.errorFg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
