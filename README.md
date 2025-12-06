📱 HR–Finance Mobile App

Aplikasi mobile Employee Self-Service (ESS) untuk akses slip gaji, riwayat pinjaman, dan pengajuan pinjaman, terintegrasi dengan sistem HR–Finance PT. Taman Media Indonesia.

📌 Overview

HR–Finance Mobile App adalah aplikasi berbasis Flutter yang memungkinkan karyawan mengakses informasi keuangan pribadi secara cepat dan praktis. Aplikasi ini terhubung dengan backend Laravel yang digunakan untuk memproses data slip gaji, autentikasi, dan transaksi pinjaman secara aman.

Aplikasi ini dikembangkan sebagai solusi dari permasalahan utama pada sistem payroll yang masih manual dan tidak mobile-friendly.

✨ Main Features

🔐 Login & Authentication (Laravel Sanctum / Token)

📄 Lihat & Unduh Slip Gaji (PDF)

💸 Pengajuan Pinjaman

📊 Riwayat Pinjaman

🔔 Notifikasi (FCM)

📱 UI/UX modern berbasis Flutter

🎯 Problem Background

Banyak perusahaan, termasuk PT. Taman Media Indonesia, masih menggunakan website payroll lama yang kurang mobile-friendly. Karyawan sering mengalami:

Sulit mengakses slip gaji dari smartphone

Domain website mudah lupa

Tidak ada fitur cetak slip gaji langsung dari HP

Pengajuan pinjaman masih manual

Proses approval memakan waktu lama

Aplikasi mobile ESS ini hadir untuk meningkatkan efisiensi HR–Finance dan kenyamanan karyawan.

🧠 Empathy Map Summary

User persona: Maida (29 th), Staff Operasional yang sering membutuhkan slip gaji dan kemudahan pengajuan pinjaman.

Pains:

Website tidak mobile-friendly

Proses pinjaman manual

Slip gaji tidak bisa diunduh langsung

Login rumit

Gains:

Akses slip gaji cepat

Pengajuan pinjaman via aplikasi

Notifikasi otomatis

UI nyaman dan modern

💡 Offered Solution

Membangun aplikasi mobile ESS dengan kemampuan:

Mengakses dan mengunduh slip gaji secara langsung

Mengajukan dan memantau status pinjaman

Login cepat dan aman

Integrasi penuh dengan sistem payroll backend Laravel

Notifikasi otomatis untuk status slip & pinjaman

Tujuan utamanya adalah menghadirkan pengalaman digital modern dan efisiensi bisnis yang lebih baik.

🧩 User Story

Beberapa user story penting:

Sebagai karyawan, saya ingin login ke aplikasi sehingga dapat mengakses informasi pribadi.

Sebagai karyawan, saya ingin melihat slip gaji bulan tertentu.

Sebagai karyawan, saya ingin mengunduh slip gaji dalam bentuk PDF.

Sebagai karyawan, saya ingin mengajukan pinjaman dengan nominal tertentu.

Sebagai admin, saya ingin mengelola data slip dan pinjaman melalui dashboard web.

🛠️ Tech Stack
📱 Mobile (Frontend)

Flutter & Dart

State Management: BLoC

UI/UX: Figma

🖥️ Backend

Laravel

Authentication: Sanctum / Token

PDF generator: laravel-dompdf / Snappy

🗄️ Database

MySQL atau PostgreSQL

🌐 API Integration

REST API

Firebase Cloud Messaging (Notifikasi)

🚀 Deployment

Backend: Google Cloud Run / Hostinger

Database: Cloud SQL / Supabase / Aiven

Mobile App: Google Play Store

🔧 Developer Tools

VS Code

Postman

GitHub

Android Emulator

🏗️ System Architecture
System Overview

Flutter mobile app & Laravel web admin terhubung ke API server Laravel yang sama.

API memproses permintaan dari frontend dan berinteraksi dengan database relasional.

Architecture Flow

User → Mobile App

App → REST API

API → Database (read/write)

Response → Mobile

Admin dashboard → API yang sama

Notifikasi melalui FCM

🧪 Development Method

Model SDLC yang digunakan: Waterfall

Requirement

Design (UI/UX, arsitektur, diagram)

Implementation (Flutter, Laravel)

Verification (Testing API & Mobile)

Maintenance

📌 Project Structure (rekomendasi)
/mobile-app
  /lib
  /assets
  /bloc
  pubspec.yaml

/backend
  /app
  /routes
  /database
  composer.json

/docs
  proposal.pdf
  architecture.png

📍 Future Improvements

Fitur absensi digital

Pengajuan cuti

Integrasi fingerprint attendance

Dashboard analytics

Security hardening API & mobile

👨‍💻 Author

Ahmad Irvan Maulana

Universitas Ciputra Surabaya