import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/validasi_pelanggaran_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/riwayat_pelanggaran_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/laporan_pelanggaran_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/profile_page.dart';

class DashboardBKPage extends StatelessWidget {
  const DashboardBKPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Text(
                'Selamat datang\ndi Dashboard Konseling',
                textAlign: TextAlign.center,
                style: tealTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 50),

              // Menu Items
              buildMenuButton(
                assetIcon: 'assets/ic_validasi_pelanggaran.png',
                label: 'Validasi Pelanggaran',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ValidasiPelanggaranPage()),
                  );
                },
              ),
              buildMenuButton(
                assetIcon: 'assets/ic_riwayat_pelanggaran.png',
                label: 'Riwayat Pelanggaran',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RiwayatPelanggaranPage()),
                  );
                },
              ),
              buildMenuButton(
                assetIcon: 'assets/ic_laporan_pelanggaran.png',
                label: 'Laporan Pelanggaran',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LaporanPelanggaranPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        height: 65,
        decoration: BoxDecoration(
          color: tealColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 90),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            bottomNavItem('assets/ic_home.png', 'Home'),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileBKPage(),
                  ),
                );
              },
              child: bottomNavItem('assets/ic_profile.png', 'Profile'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton({
    required String assetIcon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        decoration: BoxDecoration(
          color: tealColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              assetIcon,
              width: 35,
              height: 35,
              color: lightColor,
            ),
            const SizedBox(width: 20),
            Text(
              label,
              style: lightTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomNavItem(String iconPath, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          iconPath,
          width: 25,
          height: 25,
          color: lightColor,
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: lightTextStyle.copyWith(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
