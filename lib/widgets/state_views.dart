import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_dimens.dart';
import '../theme/app_text_styles.dart';

/// Tampilan seragam untuk tiga kondisi layar data: memuat, gagal, dan
/// kosong. Pesan kesalahan sudah disusun lapisan data
/// (`repository_exceptions.dart`), layar tinggal meneruskannya.

class LoadingView extends StatelessWidget {
  final String? message;

  const LoadingView({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpace.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox.square(
              dimension: AppSize.iconMd + 4,
              child: CircularProgressIndicator(strokeWidth: 2.5),
            ),
            if (message != null) ...[
              const SizedBox(height: AppSpace.lg),
              Text(message!,
                  style: AppTextStyles.bodySecondary,
                  textAlign: TextAlign.center),
            ],
          ],
        ),
      ),
    );
  }
}

class ErrorView extends StatelessWidget {
  final String message;
  final String title;
  final VoidCallback? onRetry;

  const ErrorView({
    super.key,
    required this.message,
    this.title = 'Gagal memuat data',
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return _MessageView(
      icon: Icons.cloud_off_rounded,
      iconColor: AppColors.error,
      title: title,
      message: message,
      action: onRetry == null
          ? null
          : OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Coba lagi'),
            ),
    );
  }
}

class EmptyView extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const EmptyView({
    super.key,
    this.icon = Icons.inbox_outlined,
    required this.title,
    this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return _MessageView(
      icon: icon,
      iconColor: AppColors.textSecondary,
      title: title,
      message: message,
      action: (actionLabel == null || onAction == null)
          ? null
          : OutlinedButton(onPressed: onAction, child: Text(actionLabel!)),
    );
  }
}

class _MessageView extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String? message;
  final Widget? action;

  const _MessageView({
    required this.icon,
    required this.iconColor,
    required this.title,
    this.message,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpace.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppSize.iconLg, color: iconColor),
            const SizedBox(height: AppSpace.lg),
            Text(title, style: AppTextStyles.title, textAlign: TextAlign.center),
            if (message != null && message!.isNotEmpty) ...[
              const SizedBox(height: AppSpace.sm),
              Text(message!,
                  style: AppTextStyles.bodySecondary,
                  textAlign: TextAlign.center),
            ],
            if (action != null) ...[
              const SizedBox(height: AppSpace.xl),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}
