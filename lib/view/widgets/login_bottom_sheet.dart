part of 'widgets.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<WelcomeViewmodel>(context, listen: false);

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),

              // ===== Header =====
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("welcome back !!!", style: TextStyle(fontSize: 20)),
                      Text('Login', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/images/close.png', height: 30),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ===== Email =====
              Consumer<WelcomeViewmodel>(
                builder: (_, vm, __) => TextField(
                  controller: vm.usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: "email",
                    errorText: vm.usernameValidate ? 'Masukan username yang valid' : null,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===== Password =====
              Consumer<WelcomeViewmodel>(
                builder: (_, vm, __) => TextField(
                  controller: vm.passwordController,
                  obscureText: vm.isHiddenPassword,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    labelText: "password",
                    errorText: vm.passwordValidate ? 'Masukan password' : null,
                    suffixIcon: IconButton(
                      icon: Icon(vm.isHiddenPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onPressed: vm.togglePasswordVisibility,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ===== Button Login =====
              SizedBox(
                height: 60,
                width: double.infinity,
                child: TextButton(
                  style: controller.loginButtonStyle2(),
                  onPressed: () async {
                    if (controller.validateLogin()) {
                      await controller.loginUser(
                        controller.usernameController.text,
                        controller.passwordController.text,
                      );
                    }
                  },
                  child: Consumer<WelcomeViewmodel>(
                    builder: (_, vm, __) {
                      return vm.isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text('Login');
                    },
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
