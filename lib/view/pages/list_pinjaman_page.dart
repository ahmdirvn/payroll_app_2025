part of 'pages.dart';

class ListPinjamanPage extends StatelessWidget {
  const ListPinjamanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ListPinjamanViewModel()..fetchPinjaman(),
      child: Consumer<ListPinjamanViewModel>(
        builder: (context, vm, _) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text("List Pinjaman", style: TextStyle(color: Colors.white)),
              centerTitle: true,
              backgroundColor: const Color.fromRGBO(91, 207, 197, 1),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
            ),
            body: vm.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: vm.riwayatPinjaman.length,
                            itemBuilder: (context, index) {
                              final item = vm.riwayatPinjaman[index];

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Container(
                                  height: 146,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    gradient: const LinearGradient(
                                      colors: [Color.fromRGBO(219, 240, 254, 1), Color.fromRGBO(250, 249, 255, 1)],
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CustomBoldText(kata: item.nama),
                                            const Spacer(),
                                            _StatusDot(status: item.status),
                                            CustomText(kata: item.status),
                                          ],
                                        ),
                                        CustomText(kata: 'Besar Pinjaman : ${vm.formatRupiah(item.nilaiPinjaman)}'),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            const Icon(Icons.date_range),
                                            CustomBoldText(kata: item.formattedCreatedAt),
                                            const Spacer(),
                                            GestureDetector(
                                              onTap: () => vm.cetakPinjaman(item.id),
                                              child: const Text(
                                                'Lihat Detail PDF',
                                                style: TextStyle(color: Color.fromRGBO(91, 207, 197, 1)),
                                              ),
                                            ),
                                            const Icon(Icons.arrow_forward, color: Color.fromRGBO(91, 207, 197, 1)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        TextButton(
                          style: vm.buttonPinjaman(),
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const PengajuanPinjamanPage()),
                            );
                            if (result == 'refresh') {
                              vm.fetchPinjaman();
                            }
                          },
                          child: const Text('Ajukan Peminjaman'),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class _StatusDot extends StatelessWidget {
  final String status;

  const _StatusDot({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'ditolak':
        color = Colors.red;
        break;
      case 'diproses':
        color = Colors.orange;
        break;
      case 'diterima':
        color = Colors.green;
        break;
      default:
        color = Colors.black;
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
