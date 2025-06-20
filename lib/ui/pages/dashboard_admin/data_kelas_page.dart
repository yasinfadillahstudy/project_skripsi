import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/detail_kelas_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/tambah_kelas_page.dart';

class DataKelasPage extends StatefulWidget {
  const DataKelasPage({super.key});

  @override
  State<DataKelasPage> createState() => _DataKelasPageState();
}

class _DataKelasPageState extends State<DataKelasPage> {
  final List<Map<String, String>> allDataKelas = [
    {'nama': 'Ahmad Agung', 'kelas': '7A'},
    {'nama': 'Agung Setiabudi', 'kelas': '8A'},
    {'nama': 'Anisa Gustianing', 'kelas': '9A'},
  ];

  List<Map<String, String>> displayedDataKelas = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedDataKelas = List.from(allDataKelas);
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
    if (query.isEmpty) {
      setState(() {
        displayedDataKelas = List.from(allDataKelas);
      });
    } else {
      setState(() {
        displayedDataKelas = allDataKelas
            .where((item) =>
                item['nama']!.toLowerCase().contains(query) ||
                item['kelas']!.toLowerCase().contains(query))
            .toList();
      });
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
          'Data Kelas',
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
            // Search Bar - Simplified without icon
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
                      builder: (context) => const TambahKelasPage(),
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
              child: ListView.builder(
                itemCount: displayedDataKelas.length,
                itemBuilder: (context, index) {
                  final item = displayedDataKelas[index];
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
                              builder: (context) => DetailKelasPage(
                                namaWaliKelas: item['nama']!,
                                kelas: item['kelas']!,
                                namaSiswa: item['nama']!,
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
