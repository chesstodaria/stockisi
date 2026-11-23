import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Logo teks Stockisi: ikon kotak gudang di atas latar navy dan nama app.
/// Dipakai di Splash dan Login.
class StockisiWordmark extends StatelessWidget {
  const StockisiWordmark({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Stockisi',
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.navy,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: const Icon(Icons.inventory_2_rounded,
                color: AppColors.onNavy, size: 22),
          ),
          const SizedBox(width: AppSpace.sm),
          Text(
            'Stockisi',
            style: AppTextStyles.headline.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.navy,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }
}
