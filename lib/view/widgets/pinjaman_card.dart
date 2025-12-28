part of 'widgets.dart';

class PinjamanCard extends StatelessWidget {
  final Datum item;
  final VoidCallback onDetail;

  const PinjamanCard({super.key, required this.item, required this.onDetail});

  @override
  Widget build(BuildContext context) {
    final rupiah = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

    Color statusColor() {
      switch (item.status) {
        case 'ditolak':
          return Colors.red;
        case 'diproses':
          return Colors.orange;
        case 'diterima':
          return Colors.green;
        default:
          return Colors.black;
      }
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: const LinearGradient(colors: [Color.fromRGBO(219, 240, 254, 1), Color.fromRGBO(250, 249, 255, 1)]),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomBoldText(kata: item.nama),
              const Spacer(),
              CircleAvatar(radius: 5, backgroundColor: statusColor()),
              const SizedBox(width: 6),
              CustomText(kata: item.status),
            ],
          ),
          CustomText(kata: 'Besar Pinjaman : ${rupiah.format(item.nilaiPinjaman)}'),
          const SizedBox(height: 6),
          CustomBoldText(kata: item.formattedCreatedAt),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: onDetail, child: const Text('Lihat Detail PDF')),
          ),
        ],
      ),
    );
  }
}
