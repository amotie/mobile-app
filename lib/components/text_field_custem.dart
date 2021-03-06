import 'package:flutter/material.dart';

class TextFieldCustem extends StatelessWidget {
  final String label;
  final IconData prefexIcon;
  final Function onChanged;
  final Function onSubmitted;
  final TextInputType keyboardType;
  final bool obscureText;
  final String errorMessege;

  TextFieldCustem({
    @required this.label,
    this.prefexIcon,
    this.onChanged,
    this.onSubmitted,
    this.keyboardType,
    this.obscureText,
    this.errorMessege,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).accentColor,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      obscureText: obscureText != null ? obscureText : false,
      decoration: InputDecoration(
        focusColor: Theme.of(context).accentColor,
        hoverColor: Theme.of(context).accentColor,
        errorText: errorMessege,
        errorMaxLines: 2,
        prefixIcon: Icon(prefexIcon),
        labelText: label,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
