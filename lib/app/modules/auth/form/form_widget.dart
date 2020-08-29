import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final hint;
  final onChanged;
  final obscure;
  final type;

  const FormWidget({
    @required this.hint,
    @required this.onChanged,
    @required this.obscure,
    @required this.type,
  });
  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(vertical: sh * 0.02, horizontal: sw * 0.03),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: sw * 0.05),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(sh),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                offset: Offset(2, 2),
              )
            ]),
        child: TextFormField(
          onChanged: onChanged,
          obscureText: obscure,
          keyboardType: type,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
