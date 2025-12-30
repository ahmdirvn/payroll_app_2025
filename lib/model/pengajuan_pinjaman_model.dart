// To parse this JSON data, do
//
// final pengajuanPinjamanModel = pengajuanPinjamanModelFromJson(jsonString);

import 'dart:convert';

PengajuanPinjamanModel pengajuanPinjamanModelFromJson(String str) => PengajuanPinjamanModel.fromJson(json.decode(str));

String pengajuanPinjamanModelToJson(PengajuanPinjamanModel data) => json.encode(data.toJson());

class PengajuanPinjamanModel {
  String message;
  Data data;

  PengajuanPinjamanModel({required this.message, required this.data});

  factory PengajuanPinjamanModel.fromJson(Map<String, dynamic> json) =>
      PengajuanPinjamanModel(message: json["message"], data: Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() => {"message": message, "data": data.toJson()};
}

class Data {
  int sdmId;
  String nama;
  String nik;
  String entitas;
  String divisi;
  String jabatan;
  String nilaiPinjaman;
  String keterangan;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  Data({
    required this.sdmId,
    required this.nama,
    required this.nik,
    required this.entitas,
    required this.divisi,
    required this.jabatan,
    required this.nilaiPinjaman,
    required this.keterangan,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    sdmId: json["sdm_id"],
    nama: json["nama"],
    nik: json["nik"],
    entitas: json["entitas"],
    divisi: json["divisi"],
    jabatan: json["jabatan"],
    nilaiPinjaman: json["nilai_pinjaman"],
    keterangan: json["keterangan"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "sdm_id": sdmId,
    "nama": nama,
    "nik": nik,
    "entitas": entitas,
    "divisi": divisi,
    "jabatan": jabatan,
    "nilai_pinjaman": nilaiPinjaman,
    "keterangan": keterangan,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
