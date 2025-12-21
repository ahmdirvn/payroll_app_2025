part of 'widgets.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<WelcomeViewmodel>();

    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextButton(
        style: controller.loginButtonStyle(),
        onPressed: () {
          showModalBottomSheet(isScrollControlled: true, context: context, builder: (_) => const LoginBottomSheet());
        },
        child: const Text('Login'),
      ),
    );
  }
}
