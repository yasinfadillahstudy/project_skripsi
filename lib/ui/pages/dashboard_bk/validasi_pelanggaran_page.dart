import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_bk/detail_validasi_page.dart';

class ValidasiPelanggaranPage extends StatefulWidget {
  const ValidasiPelanggaranPage({super.key});

  @override
  State<ValidasiPelanggaranPage> createState() =>
      _ValidasiPelanggaranPageState();
}

class _ValidasiPelanggaranPageState extends State<ValidasiPelanggaranPage> {
  final List<Map<String, String>> violations = [
    {
      'name': 'Ahmad Agung',
      'points': '25',
      'type': 'Berat',
      'date': '01 Juni 2024',
      'status': 'Menunggu Validasi'
    },
    {
      'name': 'Ahmad Agung',
      'points': '25',
      'type': 'Berat',
      'date': '01 Juni 2024',
      'status': 'Tervalidasi'
    },
    {
      'name': 'Ahmad Agung',
      'points': '25',
      'type': 'Berat',
      'date': '01 Juni 2024',
      'status': 'Validasi Ditolak'
    },
  ];

  List<Map<String, String>> filteredViolations = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredViolations = List.from(violations);
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredViolations = violations.where((violation) {
        return violation['name']!.toLowerCase().contains(query) ||
            violation['status']!.toLowerCase().contains(query);
      }).toList();
    });
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Menunggu Validasi':
        return Colors.orange;
      case 'Tervalidasi':
        return Colors.green;
      case 'Validasi Ditolak':
        return Colors.red;
      default:
        return tealColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundColor,
      appBar: AppBar(
        backgroundColor: lightbackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/ic_kiri.png', width: 25),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Validasi Pelanggaran',
          style: tealTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: tealColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: tealTextStyle,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Violation List
            Expanded(
              child: ListView.builder(
                itemCount: filteredViolations.length,
                itemBuilder: (context, index) {
                  final violation = filteredViolations[index];
                  final statusColor = _getStatusColor(violation['status']!);

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailValidasiPage(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: tealColor,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 5,
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
                                // Student Name
                                Text(
                                  violation['name']!,
                                  style: tealTextStyle.copyWith(
                                    fontWeight: bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Violation Details
                                Row(
                                  children: [
                                    _buildDetailChip(
                                      value: violation['points']!,
                                      backgroundColor:
                                          tealColor.withOpacity(0.2),
                                    ),
                                    const SizedBox(width: 8),
                                    _buildDetailChip(
                                      value: violation['type']!,
                                      backgroundColor:
                                          tealColor.withOpacity(0.2),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        violation['date']!,
                                        style: tealTextStyle.copyWith(
                                            fontSize: 14),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),

                                // Status
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    violation['status']!,
                                    style: TextStyle(
                                      color: statusColor,
                                      fontSize: 14,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Right arrow in circle
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: tealColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                'assets/ic_right.png',
                                width: 20,
                                color: whiteColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailChip({
    required String value,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        value,
        style: tealTextStyle.copyWith(fontSize: 14),
      ),
    );
  }
}
