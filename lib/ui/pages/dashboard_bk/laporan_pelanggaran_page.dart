import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/detail_laporan_page.dart';

class LaporanPelanggaranPage extends StatefulWidget {
  const LaporanPelanggaranPage({super.key});

  @override
  State<LaporanPelanggaranPage> createState() => _LaporanPelanggaranPageState();
}

class _LaporanPelanggaranPageState extends State<LaporanPelanggaranPage> {
  DateTime _fromDate = DateTime(2025, 6, 1);
  DateTime _toDate = DateTime(2025, 6, 1);

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate ? _fromDate : _toDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != (isFromDate ? _fromDate : _toDate)) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    const monthNames = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return "${date.day} ${monthNames[date.month - 1]} ${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundColor,
      appBar: AppBar(
        title: Text(
          'Laporan Pelanggaran',
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
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Date Range Selector - Wrapped in Teal Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: tealColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildDateSelector(
                          label: 'From date',
                          date: _fromDate,
                          onTap: () => _selectDate(context, true),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildDateSelector(
                          label: 'To date',
                          date: _toDate,
                          onTap: () => _selectDate(context, false),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Tampilkan Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _applyFilter,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Tampilkan',
                        style: tealTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Violation List
            _buildViolationList(context),
            const SizedBox(height: 32),

            // Export Buttons
            _buildExportButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildDateSelector({
    required String label,
    required DateTime date,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: lightTextStyle.copyWith(fontSize: 14)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: tealColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset(
                  'assets/ic_kalender.png',
                  width: 20,
                  height: 20,
                  color: lightColor,
                ),
                const SizedBox(width: 8),
                Text(
                  _formatDate(date),
                  style: lightTextStyle.copyWith(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildViolationList(BuildContext context) {
    final violations = [
      {
        'name': 'Ahmad Agung',
        'points': '25',
        'type': 'Berat',
        'date': '01 Juni 2024'
      },
      {
        'name': 'Ahmad Agung',
        'points': '25',
        'type': 'Berat',
        'date': '01 Juni 2024'
      },
      {
        'name': 'Ahmad Agung',
        'points': '25',
        'type': 'Berat',
        'date': '01 Juni 2024'
      },
    ];

    return Column(
      children: violations
          .map((violation) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailLaporanPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: tealColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                violation['name']!,
                                style: lightTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: semiBold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${violation['points']} | ${violation['type']} | ${violation['date']}',
                                style: lightTextStyle.copyWith(fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        // Right arrow
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: lightColor,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/ic_right.png',
                              width: 20,
                              color: tealColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildExportButtons() {
    return Row(
      children: [
        Expanded(
          child: _buildExportButton(
            label: 'Cetak Excel',
            onPressed: _exportExcel,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildExportButton(
            label: 'Cetak PDF',
            onPressed: _exportPDF,
          ),
        ),
      ],
    );
  }

  Widget _buildExportButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: tealColor, // Changed to teal background
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/ic_cetak.png',
            width: 20,
            height: 20,
            color: lightColor, // Changed to light icon
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: lightTextStyle.copyWith(
              // Changed to light text
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
  }

  void _applyFilter() {
    debugPrint(
        'Filter applied: ${_formatDate(_fromDate)} - ${_formatDate(_toDate)}');
  }

  void _exportExcel() {
    debugPrint('Exporting to Excel');
  }

  void _exportPDF() {
    debugPrint('Exporting to PDF');
  }
}
