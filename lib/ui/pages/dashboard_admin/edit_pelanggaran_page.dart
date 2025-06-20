import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';

class EditPelanggaranPage extends StatelessWidget {
  final String jenis;
  final String kategori;
  final String poin;

  const EditPelanggaranPage({
    super.key,
    required this.jenis,
    required this.kategori,
    required this.poin,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> _kategoriOptions = ['Ringan', 'Sedang', 'Berat'];

    return Scaffold(
      backgroundColor: lightbackgroundColor,
      appBar: AppBar(
        backgroundColor: lightbackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/ic_kiri.png',
            width: 24,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Edit Data Pelanggaran',
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
                  // Jenis Pelanggaran Field
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      initialValue: jenis,
                      decoration: InputDecoration(
                        labelText: 'Jenis Pelanggaran',
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

                  // Kategori Dropdown
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Kategori',
                          style: lightTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: kategori,
                          dropdownColor: tealColor,
                          icon: Icon(Icons.arrow_drop_down, color: lightColor),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: tealColor,
                            hintText: 'Pilih Kategori',
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
                          items: _kategoriOptions
                              .map((kategori) => DropdownMenuItem(
                                    value: kategori,
                                    child: Text(
                                      kategori,
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
                  const SizedBox(height: 20),

                  // Poin Field
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      initialValue: poin,
                      decoration: InputDecoration(
                        labelText: 'Poin Pelanggaran',
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
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(height: 50),

                  // Tombol Perbarui Sekarang
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
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Data pelanggaran berhasil diperbarui',
                              style: lightTextStyle.copyWith(
                                fontWeight: medium,
                              ),
                            ),
                            backgroundColor: tealColor,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
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
}
