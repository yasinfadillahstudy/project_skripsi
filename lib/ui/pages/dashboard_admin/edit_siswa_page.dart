import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';

class EditSiswaPage extends StatelessWidget {
  final String namaSiswa;
  final String kelas;

  const EditSiswaPage({
    super.key,
    required this.namaSiswa,
    required this.kelas,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightbackgroundColor,
      appBar: AppBar(
        backgroundColor: lightbackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/ic_kiri.png',
            width: 24,
            color: tealColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Data Siswa',
          style: tealTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: tealColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildLabel('Nama Siswa'),
                  _buildValue(namaSiswa),
                  const SizedBox(height: 20),
                  _buildLabel('Kelas'),
                  _buildDropdownField(kelas),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                'Data siswa berhasil diperbarui',
                                style: lightTextStyle.copyWith(
                                  fontWeight: medium,
                                ),
                              ),
                            ),
                            backgroundColor: tealColor,
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lightColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        'Perbarui Sekarang',
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

  Widget _buildLabel(String label) {
    return Text(
      label,
      style: lightTextStyle.copyWith(
        fontSize: 14,
        fontWeight: medium,
      ),
    );
  }

  Widget _buildValue(String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        initialValue: value,
        style: lightTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: tealColor,
          contentPadding: const EdgeInsets.all(12),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: lightColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: lightColor),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String selectedKelas) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: DropdownButtonFormField<String>(
        value: selectedKelas,
        dropdownColor: tealColor,
        icon: Icon(Icons.arrow_drop_down, color: lightColor),
        decoration: InputDecoration(
          filled: true,
          fillColor: tealColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: lightColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: lightColor),
          ),
        ),
        items: ['7A', '7B', '8A', '8B', '9A', '9B']
            .map((kelas) => DropdownMenuItem(
                  value: kelas,
                  child: Text(
                    kelas,
                    style: lightTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ))
            .toList(),
        onChanged: (value) {},
        style: lightTextStyle.copyWith(fontSize: 16),
      ),
    );
  }
}
