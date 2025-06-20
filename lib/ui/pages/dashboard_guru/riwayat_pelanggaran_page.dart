import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/detail_riwayat_page.dart';

class RiwayatPelanggaranPage extends StatelessWidget {
  const RiwayatPelanggaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundColor,
      appBar: AppBar(
        title: Text(
          'Riwayat Pelanggaran',
          style: tealTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: lightColor, // Changed to light background
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/ic_kiri.png',
            width: 24,
            height: 24,
            color: tealColor, // Arrow color changed to teal
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // Search Bar - Modified according to requirements
            Container(
              decoration: BoxDecoration(
                color: lightColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: tealColor, width: 2), // Teal outline
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: tealTextStyle, // Teal text color
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // Violation List
            Expanded(
              child: ListView(
                children: [
                  _buildViolationItem(
                    context,
                    name: 'Ahmad Agung',
                    classInfo: '8A',
                    count: '2x',
                    points: '-50 Poin',
                    score: '50/100',
                  ),
                  const SizedBox(height: 20),
                  _buildViolationItem(
                    context,
                    name: 'Rina Marlina',
                    classInfo: '7A',
                    count: '1x',
                    points: '-20 Poin',
                    score: '80/100',
                  ),
                  const SizedBox(height: 20),
                  _buildViolationItem(
                    context,
                    name: 'Budi Setiawan',
                    classInfo: '9A',
                    count: '3x',
                    points: '-70 Poin',
                    score: '30/100',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildViolationItem(
    BuildContext context, {
    required String name,
    required String classInfo,
    required String count,
    required String points,
    required String score,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailRiwayatPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: tealColor, // Changed to teal background
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Combined name and class
                  Text(
                    '$name | $classInfo',
                    style: lightTextStyle.copyWith(
                      // Light text on teal
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Combined violation details
                  Text(
                    '$count | $points | $score',
                    style: lightTextStyle.copyWith(
                      // Light text on teal
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            // Right arrow
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: lightColor, // Light circle
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  'assets/ic_right.png',
                  width: 16,
                  color: tealColor, // Teal arrow
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
