import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/profile_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/data_kelas_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/data_siswa_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/data_pengguna_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/data_pelanggaran_page.dart';

class DashboardAdminPage extends StatelessWidget {
  const DashboardAdminPage({super.key});

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
                'Selamat datang\ndi Dashboard Admin',
                textAlign: TextAlign.center,
                style: tealTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: bold,
                ),
              ),
              const SizedBox(height: 50),

              // Tombol Menu
              buildMenuButton(
                assetIcon: 'assets/ic_data_kelas.png',
                label: 'Data Kelas',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataKelasPage()),
                  );
                },
              ),
              buildMenuButton(
                assetIcon: 'assets/ic_data_pengguna.png',
                label: 'Pengguna',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataPenggunaPage()),
                  );
                },
              ),
              buildMenuButton(
                assetIcon: 'assets/ic_data_siswa.png',
                label: 'Data Siswa',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataSiswaPage()),
                  );
                },
              ),
              buildMenuButton(
                assetIcon: 'assets/ic_pelanggaran.png',
                label: 'Pelanggaran',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataPelanggaranPage()),
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

            // Tambahkan GestureDetector agar saat diklik pindah ke Profile
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileAdminPage(),
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
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
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
