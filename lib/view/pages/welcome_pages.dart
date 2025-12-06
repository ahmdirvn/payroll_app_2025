part of 'pages.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();

}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(context) {
    final controller = Provider.of<WelcomeViewmodel>(context);
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
                      Text(
                        'Welcome',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Lewat Fina memberikan anda\nkemudahan dalam melihat gajI',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const SizedBox(height: 100),
                      // membuat button
                      SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextButton(
                          style: controller.loginButtonStyle(),
                          onPressed: () {
                            // tampillan modal login and register
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (BuildContext context,
                                      StateSetter setState) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 30),
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40),
                                              topLeft: Radius.circular(40),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(height: 25),
                                              Row(
                                                children: [
                                                  const Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "welcome back !!!",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                      Text(
                                                        'Login',
                                                        style: TextStyle(
                                                          fontSize: 30,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Spacer(),
                                                  Center(
                                                    child: InkWell(
                                                      onTap: () {
                                                        // when close button clicked
                                                        Navigator.pop(context);
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/close.png',
                                                        height: 30,
                                                        width: 30,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              // membuat form login
                                              const SizedBox(height: 25),
                                              // membuat form username login
                                              TextField(
                                                controller: controller
                                                    .usernameController,
                                                obscureText:
                                                    controller.isHiddenUsername,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  hintText: "info@example.com",
                                                  labelText: "email",
                                                  errorText: controller
                                                          .usernameValidate
                                                      ? 'Masukan username'
                                                      : null,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              // membuat form password login
                                              TextField(
                                                controller: controller
                                                    .passwordController,
                                                obscureText:
                                                    controller.isHiddenPassword,
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  hintText: "password",
                                                  labelText: "password",
                                                  errorText: controller
                                                          .passwordValidate
                                                      ? 'Masukan password'
                                                      : null,
                                                  suffixIcon: IconButton(
                                                    icon: Icon(controller
                                                            .isHiddenPassword
                                                        ? Icons
                                                            .visibility_off_outlined
                                                        : Icons
                                                            .visibility_outlined),
                                                    onPressed: () {
                                                      setState(() {
                                                        controller
                                                                .isHiddenPassword =
                                                            !controller
                                                                .isHiddenPassword;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              // membuat button login
                                              SizedBox(
                                                height: 60,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.9,
                                                child: TextButton(
                                                  style: controller
                                                      .loginButtonStyle2(),
                                                  onPressed: () async {
                                                    // Validate form
                                                    setState(() {
                                                      controller
                                                              .usernameValidate =
                                                          controller
                                                              .usernameController
                                                              .text
                                                              .isEmpty;
                                                      controller
                                                              .passwordValidate =
                                                          controller
                                                              .passwordController
                                                              .text
                                                              .isEmpty;
                                                    });

                                                    // If validation passes, attempt login
                                                    if (!controller
                                                            .usernameValidate &&
                                                        !controller
                                                            .passwordValidate) {
                                                      try {
                                                        await controller
                                                            .loginUser(
                                                          controller
                                                              .usernameController
                                                              .text,
                                                          controller
                                                              .passwordController
                                                              .text,
                                                        );
                                                        // If login is successful, navigate to home page
                                                      } catch (e) {
                                                        // Handle login failure
                                                        // Show a dialog or a snackbar with the error message
                                                        print(
                                                            'Login failed: $e');
                                                      }
                                                    }
                                                  },
                                                  child: controller.isLoading
                                                      ? const CircularProgressIndicator()
                                                      : const Text('Login'),
                                                ),
                                              ),
                                              const SizedBox(height: 40),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  Text(
                    'All Right Reserved @2024',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
