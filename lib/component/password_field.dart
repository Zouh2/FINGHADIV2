import 'package:fen_ghadi/utilis/style.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  final String hintText;
  const PasswordField({
    super.key,
    required this.hintText, required TextEditingController controller,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.centerRight, children: [
      TextField(
        cursorColor: accent,
        obscureText: !isVisible,
        enableSuggestions: false,
        autocorrect: false,
        style: p1,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password, size: 22, color: text),
          hintText: widget.hintText,
          hintStyle: p1,
          fillColor: Colors.grey[100],
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: small),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          setState(() {
            isVisible = !isVisible;
          });
        },
        icon: Icon(
          isVisible ? Icons.visibility_off : Icons.remove_red_eye_rounded,
          color: Colors.grey[700],
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        alignment: Alignment.centerRight,
      ),
    ]);
  }
}
