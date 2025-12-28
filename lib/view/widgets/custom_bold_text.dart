part of 'widgets.dart';

// custom text field
class CustomBoldText extends StatelessWidget {
  final String kata;
  const CustomBoldText({super.key, this.kata = 'ini text'});

  @override
  Widget build(BuildContext context) {
    return Text(kata, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500));
  }
}
