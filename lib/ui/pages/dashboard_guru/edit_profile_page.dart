import 'package:flutter/material.dart';
import 'package:tata_tertib_sekolah/shared/theme.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool _obscurePassword = true;

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
        centerTitle: true,
        title: Text(
          'Edit Profile Guru',
          style: tealTextStyle.copyWith(
            fontWeight: bold,
            fontSize: 20,
          ),
        ),
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
                  _buildLabel('Nama Lengkap'),
                  _buildValue('Shayna Hanna'),
                  const SizedBox(height: 15),
                  _buildLabel('NIP'),
                  _buildValue('19821015xxxx'),
                  const SizedBox(height: 15),
                  _buildLabel('Mata Pelajaran'),
                  _buildValue('Matematika'),
                  const SizedBox(height: 15),
                  _buildLabel('Email'),
                  _buildValue('fikri@gmail.com'),
                  const SizedBox(height: 15),
                  _buildLabel('Kata Sandi'),
                  _buildPasswordField(),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text(
                                'Profil berhasil diperbarui',
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
                          fontWeight: bold,
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

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: TextFormField(
        obscureText: _obscurePassword,
        initialValue: '12345678',
        style: lightTextStyle.copyWith(
          fontSize: 16,
          fontWeight: semiBold,
        ),
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Image.asset(
              'assets/ic_mata.png',
              width: 24,
              color: lightColor,
            ),
            onPressed: () {
              setState(() {
                _obscurePassword = !_obscurePassword;
              });
            },
          ),
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
}
