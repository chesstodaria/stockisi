import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';

/// Tombol aksi utama selebar layar (Masuk, Scan QR, Submit, Tambah).
///
/// Saat [loading], tombol menampilkan spinner dan tidak bisa ditekan lagi,
/// sehingga Submit tidak terkirim dua kali. Sengaja memakai [FilledButton]
/// biasa (bukan `FilledButton.icon`) supaya bisa dicari di test dengan
/// `find.widgetWithText(FilledButton, ...)`.
class PrimaryActionButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool loading;

  const PrimaryActionButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: AppSize.primaryButton,
      child: FilledButton(
        onPressed: loading ? null : onPressed,
        style: loading
            ? FilledButton.styleFrom(
                disabledBackgroundColor: AppColors.navy,
                disabledForegroundColor: AppColors.onNavy,
              )
            : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (loading)
              const SizedBox.square(
                dimension: AppSize.iconSm + 2,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.onNavy,
                ),
              )
            else if (icon != null)
              Icon(icon, size: 20),
            if (loading || icon != null) const SizedBox(width: AppSpace.sm),
            Flexible(child: Text(label, overflow: TextOverflow.ellipsis)),
          ],
        ),
      ),
    );
  }
}
