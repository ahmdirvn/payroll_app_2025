# HR–Finance Mobile App

Aplikasi Employee Self-Service (ESS) berbasis Flutter untuk mengakses slip gaji, riwayat pinjaman, dan pengajuan pinjaman. Terintegrasi dengan backend Laravel milik PT. Taman Media Indonesia.

---

## Ringkasan

HR–Finance Mobile App memudahkan karyawan mengakses informasi keuangan pribadi melalui smartphone. Aplikasi ini terhubung ke REST API Laravel untuk autentikasi, pengelolaan slip gaji (PDF), pengajuan pinjaman, dan notifikasi.

## Fitur Utama

- **Autentikasi**: Login aman (Laravel Sanctum / Token)
- **Slip Gaji**: Lihat dan unduh slip gaji dalam format PDF
- **Pengajuan Pinjaman**: Ajukan, pantau, dan lihat riwayat pinjaman
- **Notifikasi**: Firebase Cloud Messaging (FCM)
- **UI/UX**: Desain modern, mobile-first

## Masalah yang Diselesaikan

- Website payroll yang tidak mobile-friendly
- Proses pengajuan pinjaman yang manual
- Sulitnya mengunduh slip gaji dari HP

---

## Teknologi

- Mobile: **Flutter & Dart**
- State management: **BLoC**
- Backend: **Laravel** (Sanctum / Token)
- PDF: **laravel-dompdf** / **Snappy**
- Database: **MySQL / PostgreSQL**
- Notifikasi: **Firebase Cloud Messaging**

## Alat Pengembang

- VS Code
- Postman
- Git / GitHub
- Android Emulator

---

## Struktur Proyek (Rekomendasi)

```
/mobile-app
  /lib
  /assets
  /mvvm
  pubspec.yaml

/backend
  /app
  /routes
  /database
  composer.json

```

---

## Deployment

- Backend: Google Cloud Run / Hostinger
- Database: Cloud SQL / Supabase / Aiven
- Mobile App: Google Play Store

---

## Cara Menjalankan (singkat)

1. Pasang dependensi Flutter:

```powershell
flutter pub get
```

2. Jalankan aplikasi di emulator atau perangkat:

```powershell
flutter run
```

---

## Perbaikan Mendatang

- Absensi digital
- Pengajuan cuti
- Integrasi fingerprint attendance
- Dashboard analytics
- Peningkatan keamanan API & mobile

---

## Penulis

Ahmad Irvan Maulana — Universitas Ciputra Surabaya

---

## Refleksi

Setelah menyimak video ini, saya mendapatkan pemahaman yang lebih jelas tentang bagaimana pola arsitektur MVVM dapat diterapkan dalam proyek Flutter, khususnya saat membangun fitur CRUD menggunakan SQLite. Video ini membantu saya melihat bahwa memisahkan UI, logic, dan data bukan hanya tentang "struktur yang rapi", tetapi tentang membuat aplikasi lebih mudah dikembangkan, diuji, dan diperluas di masa depan.

Penjelasan tentang Model, View, dan ViewModel membuat saya lebih mengerti alur kerja aplikasi yang ideal. Model menangani data, View fokus pada tampilan, dan ViewModel menjadi penghubung yang mengatur proses serta memberi tahu UI saat ada perubahan. Saya baru menyadari bahwa konsep ini membuat state management lebih terkontrol, terutama ketika menggunakan paket seperti Provider.

Bagian SQLite juga membuka wawasan baru bagi saya. Ternyata, penyimpanan lokal dengan SQLite sangat cocok untuk aplikasi yang tidak membutuhkan server dan cukup mengandalkan data perangkat. Proses konfigurasi database, mulai dari membuat tabel hingga CRUD, dijelaskan dengan alur yang mudah dipahami. Penjelasan mengenai toMap() dan fromMap() membuat saya lebih mengerti bagaimana data diubah menjadi format yang bisa dibaca database.

Video ini juga menunjukkan praktik nyata membangun folder struktur seperti model, services, viewmodel, dan views, yang membantu saya memahami bagaimana memisahkan kode secara profesional. Contoh implementasi dialog tambah/edit, penggunaan Consumer, serta pembaruan UI menggunakan notifyListeners() membuat konsep MVVM menjadi sangat praktis dan nyata.

Secara keseluruhan, video ini memberikan gambaran lengkap bagaimana membangun aplikasi Flutter yang bersih dan scalable menggunakan pattern MVVM dan SQLite. Saya merasa lebih percaya diri untuk menerapkan konsep ini pada proyek Flutter saya sendiri, terutama karena setiap langkah dijelaskan dengan jelas dan berurutan, mulai dari setup hingga menjalankan aplikasi.

---
