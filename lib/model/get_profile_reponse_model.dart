// To parse this JSON data, do
//
//     final getProfileResponModel = getProfileResponModelFromJson(jsonString);

import 'dart:convert';

GetProfileResponModel getProfileResponModelFromJson(String str) => GetProfileResponModel.fromJson(json.decode(str));

String getProfileResponModelToJson(GetProfileResponModel data) => json.encode(data.toJson());

class GetProfileResponModel {
  Data data;

  GetProfileResponModel({required this.data});

  factory GetProfileResponModel.fromJson(Map<String, dynamic> json) =>
      GetProfileResponModel(data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"data": data.toJson()};
}

class Data {
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

  Data({
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
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    nama: json["nama"],
    entitasId: json["entitas_id"],
    jabatanId: json["jabatan_id"],
    divisiId: json["divisi_id"],
    email: json["email"],
    nik: json["nik"],
    jenisKelamin: json["jenis_kelamin"],
    status: json["status"],
    deleted: json["deleted"],
    chatId: json["chat_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
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
  };
}
