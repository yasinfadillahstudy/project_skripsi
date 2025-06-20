import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/detail_siswa_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/tambah_siswa_page.dart';

class DataSiswaPage extends StatefulWidget {
  const DataSiswaPage({super.key});

  @override
  State<DataSiswaPage> createState() => _DataSiswaPageState();
}

class _DataSiswaPageState extends State<DataSiswaPage> {
  final List<Map<String, String>> allDataSiswa = [
    {'nama': 'Ahmad Agung', 'kelas': '7A'},
    {'nama': 'Agung Setiabudi', 'kelas': '8A'},
    {'nama': 'Anisa Gustianing', 'kelas': '9A'},
  ];

  late List<Map<String, String>> displayedDataSiswa;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedDataSiswa = List.from(allDataSiswa);
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
      displayedDataSiswa = allDataSiswa
          .where((item) =>
              item['nama']?.toLowerCase().contains(query) == true ||
              item['kelas']?.toLowerCase().contains(query) == true)
          .toList();
    });
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
          'Data Siswa',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: tealColor,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: tealTextStyle.copyWith(fontSize: 16),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
                style: tealTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 50),

            // Tambah Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tealColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TambahSiswaPage(),
                    ),
                  );
                },
                child: Text(
                  'Tambah',
                  style: lightTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),

            // List of Students
            Expanded(
              child: displayedDataSiswa.isEmpty
                  ? Center(
                      child: Text(
                        'Tidak ada data ditemukan',
                        style: tealTextStyle.copyWith(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayedDataSiswa.length,
                      itemBuilder: (context, index) {
                        final item = displayedDataSiswa[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            color: tealColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            title: Text(
                              '${item['nama']} | ${item['kelas']}',
                              style: lightTextStyle.copyWith(
                                fontWeight: medium,
                                fontSize: 14,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailSiswaPage(
                                      namaSiswa: item['nama'] ?? '',
                                      kelas: item['kelas'] ?? '',
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: lightColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/ic_right.png',
                                    width: 16,
                                    color: tealColor,
                                  ),
                                ),
                              ),
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
}
