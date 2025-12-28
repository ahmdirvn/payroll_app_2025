part of 'pages.dart';

class PengajuanPinjamanPage extends StatelessWidget {
  const PengajuanPinjamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<PengajuanPinjamanViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text("Pengajuan Pinjaman")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: vm.name,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: vm.nik,
              decoration: const InputDecoration(labelText: 'NIK'),
            ),
            TextField(
              controller: vm.pinjaman,
              decoration: const InputDecoration(labelText: 'Pinjaman'),
            ),
            const SizedBox(height: 20),
            vm.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: () => vm.submit(context), child: const Text("Kirim")),
          ],
        ),
      ),
    );
  }
}
