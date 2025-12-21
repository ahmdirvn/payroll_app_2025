part of 'pages.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  @override
  Widget build(context) {
    final controller = context.read<WelcomeViewmodel>();

    return Scaffold(
      backgroundColor: const Color(0xFF74EBE0),
      appBar: null,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/welcome_page.png',
                        height: 333,
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Welcome', style: Theme.of(context).textTheme.headlineLarge),
                      const SizedBox(height: 15),
                      const Text(
                        'Lewat Fina memberikan anda\nkemudahan dalam melihat gaji',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(height: 100),
                      // membuat button
                      const LoginButton(),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Text('All Right Reserved @2025', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
