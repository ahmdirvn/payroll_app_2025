part of 'widgets.dart'; 

class HomeMenu extends StatelessWidget {
  final String label;
  final String icon;
  final VoidCallback onTap;

  const HomeMenu({super.key, required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: onTap, icon: Image.asset(icon)),
        Text(label),
      ],
    );
  }
}
