part of 'widgets.dart';

// custom text field
// custom text field
class CustomText extends StatelessWidget {
  final String kata;
  final Color color;

  const CustomText({super.key, this.kata = 'ini text', this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(kata, style: TextStyle(fontSize: 14, color: color));
  }
}
