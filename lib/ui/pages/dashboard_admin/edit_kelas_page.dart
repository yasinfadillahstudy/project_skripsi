import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';

class EditKelasPage extends StatelessWidget {
  const EditKelasPage({super.key});

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
          'Edit Data Kelas',
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
                  _buildLabel('Nama Wali Kelas'),
                  _buildValue('Shayna Hanna'),
                  const SizedBox(height: 20),
                  _buildLabel('Kelas'),
                  _buildDropdownField(),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                'Data kelas berhasil diperbarui',
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

  Widget _buildDropdownField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: DropdownButtonFormField<String>(
        value: null, // Set to null to show hint text
        hint: Text(
          'Pilih Kelas',
          style: lightTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold,
          ),
        ),
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
