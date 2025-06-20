import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';

class DetailRiwayatPage extends StatelessWidget {
  const DetailRiwayatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundColor,
      appBar: AppBar(
        title: Text(
          'Detail Riwayat Pelanggaran',
          style: tealTextStyle.copyWith(
            fontSize: 20,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        backgroundColor: lightColor,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/ic_kiri.png',
            width: 24,
            height: 24,
            color: tealColor,
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
            // Violation Details Table
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: tealColor,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(1.5),
                },
                border: const TableBorder(
                  horizontalInside: BorderSide(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                  ),
                ),
                children: [
                  // Nama Siswa & Tanggal
                  _buildTableRow('Nama Siswa', 'Fikri'),
                  _buildTableRow('Tanggal', '20 Mei 2025'),

                  // Kelas & Catatan
                  _buildTableRow('Kelas', '8A'),
                  _buildTableRow(
                      'Catatan', 'Tidak memakai seragam saat upacara'),

                  // Jenis Pelanggaran
                  _buildTableRow('Jenis Pelanggaran', 'Tawuran'),

                  // Poin Pelanggaran & Kategori
                  _buildTableRow('Poin Pelanggaran', '10'),
                  _buildTableRow('Kategori', 'Berat'),
                ],
              ),
            ),
            const SizedBox(height: 50),

            // Back Button (centered like in detail_validasi_page)
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tealColor,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Kembali ke Dashboard',
                  style: lightTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(String label, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            label,
            style: lightTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            value,
            style: lightTextStyle.copyWith(
              fontSize: 14,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
