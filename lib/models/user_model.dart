class UserModel {
  final int idUser;
  final String nama;
  final String email;
  final String role;

  UserModel({
    required this.idUser,
    required this.nama,
    required this.email,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: int.parse(json['id_user'].toString()),
      nama: json['nama'],
      email: json['email'],
      role: json['role'],
    );
  }
}
