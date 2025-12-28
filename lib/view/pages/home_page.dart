part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<HomeViewModel>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, vm, _) {
        if (vm.isLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFF74EBE0),
          body: Column(
            children: [
              HomeHeader(
                greeting: vm.greeting,
                name: vm.name,
              ),
              const SizedBox(height: 40),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Image.asset(
                          'assets/images/companylogo.png',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HomeMenu(
                            label: "Cetak Slip",
                            icon: 'assets/images/cetakslip.png',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const CetakSlipPage(),
                                ),
                              );
                            },
                          ),
                          HomeMenu(
                            label: "Pengajuan Pinjaman",
                            icon: 'assets/images/pinjaman.png',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ListPinjamanPage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Informasi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "Dapatkan informasi slip gaji anda setiap bulan",
                        style: TextStyle(fontSize: 11),
                      ),
                      Expanded(
                        child: Image.asset(
                          "assets/images/banner.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
