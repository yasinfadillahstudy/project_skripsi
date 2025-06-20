import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/detail_pengguna_page.dart';
import 'package:tata_tertib_sekolah/ui/pages/dashboard_admin/tambah_pengguna_page.dart';

class DataPenggunaPage extends StatefulWidget {
  const DataPenggunaPage({super.key});

  @override
  State<DataPenggunaPage> createState() => _DataPenggunaPageState();
}

class _DataPenggunaPageState extends State<DataPenggunaPage> {
  final List<Map<String, String>> allUsers = [
    {
      'name': 'Ahmad Agung',
      'role': 'Bimbingan Konseling',
      'email': 'ahmadagung@gmail.com'
    },
    {
      'name': 'Budi Santoso',
      'role': 'Guru Matematika',
      'email': 'budisantoso@gmail.com'
    },
    {
      'name': 'Citra Dewi',
      'role': 'Guru Bahasa',
      'email': 'citradewi@gmail.com'
    },
  ];

  List<Map<String, String>> displayedUsers = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayedUsers = List.from(allUsers);
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
      displayedUsers = allUsers.where((user) {
        return user['name']!.toLowerCase().contains(query) ||
            user['role']!.toLowerCase().contains(query) ||
            user['email']!.toLowerCase().contains(query);
      }).toList();
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
          'Manajemen Pengguna',
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
                      builder: (context) => const TambahPenggunaPage(),
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

            // User List
            Expanded(
              child: ListView.builder(
                itemCount: displayedUsers.length,
                itemBuilder: (context, index) {
                  final user = displayedUsers[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPenggunaPage(
                            name: user['name']!,
                            role: user['role']!,
                            email: user['email']!,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(15),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user['name']!,
                                style: lightTextStyle.copyWith(
                                  fontWeight: bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user['role']!,
                                style: lightTextStyle.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                user['email']!,
                                style: lightTextStyle.copyWith(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 30,
                            height: 30,
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
}
