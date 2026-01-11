import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());

class LoginResponseModel {
  final bool success;
  final String message;
  final Data data;

  LoginResponseModel({required this.success, required this.message, required this.data});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: Data.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {'success': success, 'message': message, 'data': data.toJson()};
}

class Data {
  final User user;
  final Divisi? entitas;
  final Divisi? divisi;
  final Jabatan? jabatan;
  final String token;
  final String tokenType;

  Data({required this.user, this.entitas, this.divisi, this.jabatan, required this.token, required this.tokenType});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      user: User.fromJson(json['user'] ?? {}),
      entitas: json['entitas'] != null ? Divisi.fromJson(json['entitas']) : null,
      divisi: json['divisi'] != null ? Divisi.fromJson(json['divisi']) : null,
      jabatan: json['jabatan'] != null ? Jabatan.fromJson(json['jabatan']) : null,
      token: json['token'] ?? '',
      tokenType: json['token_type'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'user': user.toJson(),
    'entitas': entitas?.toJson(),
    'divisi': divisi?.toJson(),
    'jabatan': jabatan?.toJson(),
    'token': token,
    'token_type': tokenType,
  };
}

class Divisi {
  final int id;
  final String nama;
  final int? entitasId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? image;

  Divisi({required this.id, required this.nama, this.entitasId, this.createdAt, this.updatedAt, this.image});

  factory Divisi.fromJson(Map<String, dynamic> json) {
    return Divisi(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      entitasId: json['entitas_id'],
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'entitas_id': entitasId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'image': image,
  };
}

class Jabatan {
  final int id;
  final String nama;
  final int? tunjanganJabatan;
  final int? entitasId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? deleted;

  Jabatan({
    required this.id,
    required this.nama,
    this.tunjanganJabatan,
    this.entitasId,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  factory Jabatan.fromJson(Map<String, dynamic> json) {
    return Jabatan(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      tunjanganJabatan: json['tunjangan_jabatan'],
      entitasId: json['entitas_id'],
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      deleted: json['deleted'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'tunjangan_jabatan': tunjanganJabatan,
    'entitas_id': entitasId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'deleted': deleted,
  };
}

class User {
  final int id;
  final String nama;
  final int? entitasId;
  final int? jabatanId;
  final int? divisiId;
  final String email;
  final String? nik;
  final String jenisKelamin;
  final int status;
  final int deleted;
  final int? chatId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Divisi? entitas;
  final Divisi? divisi;
  final Jabatan? jabatan;

  User({
    required this.id,
    required this.nama,
    this.entitasId,
    this.jabatanId,
    this.divisiId,
    required this.email,
    this.nik,
    required this.jenisKelamin,
    required this.status,
    required this.deleted,
    this.chatId,
    this.createdAt,
    this.updatedAt,
    this.entitas,
    this.divisi,
    this.jabatan,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      entitasId: json['entitas_id'],
      jabatanId: json['jabatan_id'],
      divisiId: json['divisi_id'],
      email: json['email'] ?? '',
      nik: json['nik'],
      jenisKelamin: json['jenis_kelamin'] ?? '',
      status: json['status'] ?? 0,
      deleted: json['deleted'] ?? 0,
      chatId: json['chat_id'],
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      entitas: json['entitas'] != null ? Divisi.fromJson(json['entitas']) : null,
      divisi: json['divisi'] != null ? Divisi.fromJson(json['divisi']) : null,
      jabatan: json['jabatan'] != null ? Jabatan.fromJson(json['jabatan']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'entitas_id': entitasId,
    'jabatan_id': jabatanId,
    'divisi_id': divisiId,
    'email': email,
    'nik': nik,
    'jenis_kelamin': jenisKelamin,
    'status': status,
    'deleted': deleted,
    'chat_id': chatId,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'entitas': entitas?.toJson(),
    'divisi': divisi?.toJson(),
    'jabatan': jabatan?.toJson(),
  };
}
