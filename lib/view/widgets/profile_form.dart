part of 'widgets.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ProfileViewModel>();

    return ListView(
      padding: const EdgeInsets.all(30),
      children: [
        const Text("Nama"),
        CustomTextField2(controller: vm.nameController, enabled: false),
        const SizedBox(height: 10),

        const Text("Email"),
        CustomTextField2(controller: vm.emailController, enabled: false),
        const SizedBox(height: 10),

        const Text("Password Baru"),
        CustomTextField2(obsecureText: true, controller: vm.passwordController),
        const SizedBox(height: 10),

        const Text("Konfirmasi Password Baru"),
        CustomTextField2(obsecureText: true, controller: vm.confirmPasswordController),
        const SizedBox(height: 30),

        ElevatedButton(onPressed: () => vm.updateProfile(context), child: const Text("Simpan")),
        const SizedBox(height: 15),

        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () => vm.logout(context),
          child: const Text("Keluar"),
        ),
      ],
    );
  }
}
