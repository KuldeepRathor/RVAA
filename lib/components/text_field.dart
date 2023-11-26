import 'package:flutter/material.dart';

class TextfieldsWidget extends StatefulWidget {
  final String? fieldName;
  final Icon? iconName;
  final bool isObscure;
  final TextInputType? keyboardType;

  const TextfieldsWidget({
    Key? key,
    this.fieldName,
    this.iconName,
    required this.isObscure,
    this.keyboardType,
  }) : super(key: key);

  @override
  _TextfieldsWidgetState createState() => _TextfieldsWidgetState();
}

class _TextfieldsWidgetState extends State<TextfieldsWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 10,
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: widget.isObscure && obscureText,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          hintText: widget.fieldName,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          prefixIcon: widget.iconName,
          suffixIcon: widget.isObscure
              ? Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () => setState(() => obscureText = !obscureText),
                    child: Icon(
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                    ),
                  ),
                )
              : null,
          suffixIconConstraints: BoxConstraints(maxHeight: size.height * 0.05),
        ),
      ),
    );
  }
}
