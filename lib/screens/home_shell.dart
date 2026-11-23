import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'documents/document_list_screen.dart';
import 'history/history_list_screen.dart';
import 'profile/profile_screen.dart';
import 'stock/stock_card_list_screen.dart';

/// Halaman Utama (layar 3): bottom navigation dengan empat tab
/// Dokumen, Kartu Stok, Riwayat, dan Profil.
///
/// Tab dibangun saat pertama kali dibuka, lalu disimpan di [IndexedStack]
/// supaya posisi gulir dan isian tidak hilang. Kartu Stok dan Riwayat
/// dibangun ulang setiap kali tabnya dibuka lagi, karena saldo dan riwayat
/// bisa berubah setelah Submit di tab Dokumen (aturan bisnis 2).
///
/// Sengaja tidak memakai Navigator per tab: layar turunan didorong ke
/// Navigator utama, jadi tombol kembali dan [SessionGuard] berlaku sama.
class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _Tab {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final Widget Function() build;

  /// Dibangun ulang saat tab dibuka lagi supaya datanya terbaru.
  final bool refreshOnEnter;

  const _Tab(
    this.label,
    this.icon,
    this.selectedIcon,
    this.build, {
    this.refreshOnEnter = false,
  });
}

class _HomeShellState extends State<HomeShell> {
  static final _tabs = <_Tab>[
    _Tab('Dokumen', Icons.description_outlined, Icons.description_rounded,
        () => const DocumentListScreen()),
    _Tab('Kartu Stok', Icons.inventory_2_outlined, Icons.inventory_2_rounded,
        () => const StockCardListScreen(),
        refreshOnEnter: true),
    _Tab('Riwayat', Icons.history_rounded, Icons.history_rounded,
        () => const HistoryListScreen(),
        refreshOnEnter: true),
    _Tab('Profil', Icons.person_outline_rounded, Icons.person_rounded,
        () => const ProfileScreen()),
  ];

  int _index = 0;

  /// Tab yang sudah pernah dibuka. Tab lain belum dibangun sama sekali,
  /// jadi tidak memuat data sebelum dibutuhkan.
  final _visited = <int>{0};

  /// Naik setiap kali tab dibuka; dipakai sebagai key untuk tab
  /// [_Tab.refreshOnEnter].
  final _generation = List<int>.filled(_tabs.length, 0);

  void _select(int i) {
    if (i == _index) return;
    setState(() {
      if (_tabs[i].refreshOnEnter && _visited.contains(i)) _generation[i]++;
      _visited.add(i);
      _index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // Tombol kembali Android di tab lain kembali ke tab Dokumen dulu,
      // bukan langsung keluar dari app.
      canPop: _index == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _select(0);
      },
      child: Scaffold(
        body: IndexedStack(
          index: _index,
          children: [
            for (var i = 0; i < _tabs.length; i++)
              _visited.contains(i)
                  ? KeyedSubtree(
                      key: ValueKey('tab-$i-${_generation[i]}'),
                      child: _tabs[i].build(),
                    )
                  : const SizedBox.shrink(),
          ],
        ),
        bottomNavigationBar: DecoratedBox(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: AppColors.border)),
          ),
          child: NavigationBar(
            selectedIndex: _index,
            onDestinationSelected: _select,
            destinations: [
              for (final t in _tabs)
                NavigationDestination(
                  icon: Icon(t.icon),
                  selectedIcon: Icon(t.selectedIcon),
                  label: t.label,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
