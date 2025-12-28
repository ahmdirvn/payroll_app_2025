part of 'pages.dart';

class CetakSlipPage extends StatefulWidget {
  const CetakSlipPage({super.key});

  @override
  State<CetakSlipPage> createState() => _CetakSlipPageState();
}

class _CetakSlipPageState extends State<CetakSlipPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<CetakSlipViewModel>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CetakSlipViewModel>(
      builder: (context, vm, _) {
        return Scaffold(
          appBar: AppBar(title: const Text("Cetak Slip"), backgroundColor: const Color(0xFF74EBE0)),
          body: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Bulan"),
                const SizedBox(height: 10),
                DropdownField(value: vm.currentMonth.toString(), items: vm.bulan, onChanged: (v) => vm.updateMonth(v!)),
                const SizedBox(height: 20),
                const Text("Tahun"),
                const SizedBox(height: 10),
                DropdownField(value: vm.currentYear.toString(), items: vm.tahun, onChanged: (v) => vm.updateYear(v!)),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: vm.isLoading ? null : () => vm.cetakSlip(context),
                    child: vm.isLoading ? const CircularProgressIndicator() : const Text("Cetak Slip"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
