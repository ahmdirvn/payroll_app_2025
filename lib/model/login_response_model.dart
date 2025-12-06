// To parse this JSON data, do
//
//     final loginResponseModel = loginResponseModelFromJson(jsonString);

import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  bool success;
  String message;
  Data data;

  LoginResponseModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  User user;
  Divisi entitas;
  Divisi divisi;
  Jabatan jabatan;
  String token;
  String tokenType;

  Data({
    required this.user,
    required this.entitas,
    required this.divisi,
    required this.jabatan,
    required this.token,
    required this.tokenType,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
        entitas: Divisi.fromJson(json["entitas"]),
        divisi: Divisi.fromJson(json["divisi"]),
        jabatan: Jabatan.fromJson(json["jabatan"]),
        token: json["token"],
        tokenType: json["token_type"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "entitas": entitas.toJson(),
        "divisi": divisi.toJson(),
        "jabatan": jabatan.toJson(),
        "token": token,
        "token_type": tokenType,
      };
}

class Divisi {
  int id;
  String nama;
  int? entitasId;
  DateTime createdAt;
  DateTime updatedAt;
  String? image;

  Divisi({
    required this.id,
    required this.nama,
    this.entitasId,
    required this.createdAt,
    required this.updatedAt,
    this.image,
  });

  factory Divisi.fromJson(Map<String, dynamic> json) => Divisi(
        id: json["id"],
        nama: json["nama"],
        entitasId: json["entitas_id"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "entitas_id": entitasId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
      };
}

class Jabatan {
  int id;
  String nama;
  int? tunjanganJabatan;
  int entitasId;
  DateTime createdAt;
  DateTime updatedAt;
  int deleted;

  Jabatan({
    required this.id,
    required this.nama,
    this.tunjanganJabatan,
    required this.entitasId,
    required this.createdAt,
    required this.updatedAt,
    required this.deleted,
  });

  factory Jabatan.fromJson(Map<String, dynamic> json) => Jabatan(
        id: json["id"],
        nama: json["nama"],
        tunjanganJabatan: json["tunjangan_jabatan"],
        entitasId: json["entitas_id"] ?? 0,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "tunjangan_jabatan": tunjanganJabatan,
        "entitas_id": entitasId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted": deleted,
      };
}

class User {
  int id;
  String nama;
  int entitasId;
  int jabatanId;
  int divisiId;
  String email;
  String nik;
  String jenisKelamin;
  int status;
  int deleted;
  int? chatId;
  DateTime createdAt;
  DateTime updatedAt;
  Divisi entitas;
  Divisi divisi;
  Jabatan jabatan;

  User({
    required this.id,
    required this.nama,
    required this.entitasId,
    required this.jabatanId,
    required this.divisiId,
    required this.email,
    required this.nik,
    required this.jenisKelamin,
    required this.status,
    required this.deleted,
    this.chatId,
    required this.createdAt,
    required this.updatedAt,
    required this.entitas,
    required this.divisi,
    required this.jabatan,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nama: json["nama"],
        entitasId: json["entitas_id"] ?? 0,
        jabatanId: json["jabatan_id"] ?? 0,
        divisiId: json["divisi_id"] ?? 0,
        email: json["email"],
        nik: json["nik"],
        jenisKelamin: json["jenis_kelamin"],
        status: json["status"],
        deleted: json["deleted"],
        chatId: json["chat_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        entitas: Divisi.fromJson(json["entitas"]),
        divisi: Divisi.fromJson(json["divisi"]),
        jabatan: Jabatan.fromJson(json["jabatan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "entitas_id": entitasId,
        "jabatan_id": jabatanId,
        "divisi_id": divisiId,
        "email": email,
        "nik": nik,
        "jenis_kelamin": jenisKelamin,
        "status": status,
        "deleted": deleted,
        "chat_id": chatId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "entitas": entitas.toJson(),
        "divisi": divisi.toJson(),
        "jabatan": jabatan.toJson(),
      };
}
