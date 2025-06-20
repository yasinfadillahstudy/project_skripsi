import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';

class TambahPenggunaPage extends StatefulWidget {
  const TambahPenggunaPage({super.key});

  @override
  State<TambahPenggunaPage> createState() => _TambahPenggunaPageState();
}

class _TambahPenggunaPageState extends State<TambahPenggunaPage> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String? _selectedJabatan;

  final List<String> _jabatanOptions = [
    'Bimbingan Konseling',
    'Guru Matematika',
    'Guru Bahasa Inggris',
    'Guru Bahasa Indonesia',
    'Guru IPA',
    'Guru IPS',
    'Guru PPKN',
    'Guru PJOK',
    'Guru Seni Budaya',
    'Guru Prakarya',
    'Guru Agama Islam',
    'Guru TIK',
    'Administrator',
    'Staf Tata Usaha'
  ];

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
          'Tambah Pengguna',
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
            // Form Container
            Container(
              padding: const EdgeInsets.all(20),
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
              child: Column(
                children: [
                  // Nama Lengkap Field
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        labelStyle: lightTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        filled: true,
                        fillColor: tealColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightColor),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      style: lightTextStyle.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Jabatan Dropdown
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Jabatan',
                          style: lightTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _selectedJabatan,
                          dropdownColor: tealColor,
                          icon: Icon(Icons.arrow_drop_down, color: lightColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: tealColor,
                            hintText: 'Pilih Jabatan',
                            hintStyle: lightTextStyle.copyWith(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: lightColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: lightColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: lightColor),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                          ),
                          items: _jabatanOptions
                              .map((jabatan) => DropdownMenuItem(
                                    value: jabatan,
                                    child: Text(
                                      jabatan,
                                      style:
                                          lightTextStyle.copyWith(fontSize: 16),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedJabatan = newValue;
                            });
                          },
                          style: lightTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Email Field
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: lightTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                        filled: true,
                        fillColor: tealColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightColor),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: lightColor),
                        ),
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      style: lightTextStyle.copyWith(
                        fontSize: 16,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Tombol Tambah Sekarang inside the form container
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () {
                        if (_namaController.text.isEmpty ||
                            _selectedJabatan == null ||
                            _emailController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Harap lengkapi semua field',
                                style: lightTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                              backgroundColor: tealColor,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Tambah Sekarang',
                        style: tealTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _namaController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
