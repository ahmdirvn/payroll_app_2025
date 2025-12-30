part of 'pages.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileViewModel()..loadProfile(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Profile"), centerTitle: true, backgroundColor: const Color(0xFF5BCFC5)),
        body: Consumer<ProfileViewModel>(
          builder: (_, vm, __) {
            if (vm.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return const ProfileForm();
          },
        ),
      ),
    );
  }
}
