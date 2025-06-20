import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/detail_pelanggaran_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/tambah_pelanggaran_page.dart';

class DataPelanggaranPage extends StatefulWidget {
  const DataPelanggaranPage({super.key});

  @override
  State<DataPelanggaranPage> createState() => _DataPelanggaranPageState();
}

class _DataPelanggaranPageState extends State<DataPelanggaranPage> {
  final List<Map<String, String>> allDataPelanggaran = [
    {'jenis': 'Merokok', 'kategori': 'Ringan', 'poin': '10'},
    {'jenis': 'Terlambat', 'kategori': 'Sedang', 'poin': '15'},
    {'jenis': 'Berkelahi', 'kategori': 'Berat', 'poin': '25'},
  ];

  List<Map<String, String>> displayedDataPelanggaran = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedDataPelanggaran = List.from(allDataPelanggaran);
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
        displayedDataPelanggaran = List.from(allDataPelanggaran);
      });
    } else {
      setState(() {
        displayedDataPelanggaran = allDataPelanggaran
            .where((item) =>
                item['jenis']!.toLowerCase().contains(query) ||
                item['kategori']!.toLowerCase().contains(query))
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
          'Data Pelanggaran',
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
                  prefixIcon: Icon(Icons.search, color: tealColor),
                ),
                style: tealTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),

            // Tambah Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tealColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TambahPelanggaranPage(),
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
            const SizedBox(height: 30),

            // List of Violations
            Expanded(
              child: ListView.builder(
                itemCount: displayedDataPelanggaran.length,
                itemBuilder: (context, index) {
                  final item = displayedDataPelanggaran[index];
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
                        '${item['jenis']} (${item['kategori']})',
                        style: lightTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        '${item['poin']} Poin',
                        style: lightTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPelanggaranPage(
                                jenis: item['jenis']!,
                                kategori: item['kategori']!,
                                poin: item['poin']!,
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
