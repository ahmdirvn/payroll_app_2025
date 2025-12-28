part of 'widgets.dart'; 

class HomeHeader extends StatelessWidget {
  final String greeting;
  final String name;

  const HomeHeader({super.key, required this.greeting, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 40, left: 30),
      child: Row(
        children: [
          Image.asset('assets/images/profile.png'),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(greeting, style: const TextStyle(color: Colors.white)),
              Text(
                name,
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
