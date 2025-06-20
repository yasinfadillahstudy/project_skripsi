import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';

class TambahKelasPage extends StatelessWidget {
  const TambahKelasPage({super.key});

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
          'Tambah Data Kelas',
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
                  // Nama Wali Kelas Field
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nama Wali Kelas',
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

                  // Kelas Dropdown
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kelas',
                          style: lightTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          dropdownColor: tealColor,
                          icon: Icon(Icons.arrow_drop_down, color: lightColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: tealColor,
                            hintText: 'Pilih Kelas',
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
                          items: ['7A', '7B', '8A', '8B', '9A', '9B']
                              .map((kelas) => DropdownMenuItem(
                                    value: kelas,
                                    child: Text(
                                      kelas,
                                      style:
                                          lightTextStyle.copyWith(fontSize: 16),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                          style: lightTextStyle.copyWith(fontSize: 16),
                        ),
                      ],
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
                        // Fungsi tambah data
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
}
