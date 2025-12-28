// To parse this JSON data, do
//
//     final getListPinjamanModel = getListPinjamanModelFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';

GetListPinjamanModel getListPinjamanModelFromJson(String str) => GetListPinjamanModel.fromJson(json.decode(str));

String getListPinjamanModelToJson(GetListPinjamanModel data) => json.encode(data.toJson());

class GetListPinjamanModel {
  List<Datum> data;

  GetListPinjamanModel({required this.data});

  factory GetListPinjamanModel.fromJson(Map<String, dynamic> json) =>
      GetListPinjamanModel(data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))));

  Map<String, dynamic> toJson() => {"data": List<dynamic>.from(data.map((x) => x.toJson()))};
}

class Datum {
  int id;
  int sdmId;
  String nama;
  String nik;
  String entitas;
  String divisi;
  String jabatan;
  int nilaiPinjaman;
  String keterangan;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.sdmId,
    required this.nama,
    required this.nik,
    required this.entitas,
    required this.divisi,
    required this.jabatan,
    required this.nilaiPinjaman,
    required this.keterangan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    sdmId: json["sdm_id"],
    nama: json["nama"],
    nik: json["nik"],
    entitas: json["entitas"],
    divisi: json["divisi"],
    jabatan: json["jabatan"],
    nilaiPinjaman: json["nilai_pinjaman"],
    keterangan: json["keterangan"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sdm_id": sdmId,
    "nama": nama,
    "nik": nik,
    "entitas": entitas,
    "divisi": divisi,
    "jabatan": jabatan,
    "nilai_pinjaman": nilaiPinjaman,
    "keterangan": keterangan,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };

  // Getter for formatted date
  String get formattedCreatedAt {
    return DateFormat('yyyy-MM-dd').format(createdAt);
  }
}
