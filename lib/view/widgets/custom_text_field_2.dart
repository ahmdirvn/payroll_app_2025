part of 'widgets.dart';

class CustomTextField2 extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool enabled;
  final bool obsecureText;
  final TextInputType keyboardType;
  final int maxLines;

  const CustomTextField2({
    super.key,
    this.controller,
    this.hintText,
    this.enabled = true,
    this.obsecureText = false,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      obscureText: obsecureText,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        filled: true,
        fillColor: enabled ? Colors.white : Colors.grey.shade200,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF5BCFC5), width: 2),
        ),
      ),
    );
  }
}
