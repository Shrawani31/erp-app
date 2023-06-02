import 'package:erp_app/MyFonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/color_utils.dart';

class CustomPasswordTextField extends StatefulWidget {
  final validator;
  final controller;
  final focusNode;
  final hint;
  final keyboardType;
  final textEditingController;
  final onChanged;
  final obscureText;

  const CustomPasswordTextField(
      {Key? key,
      this.validator,
      this.controller,
      this.focusNode,
      this.hint,
      this.keyboardType,
      this.textEditingController,
      this.obscureText,
      this.onChanged})
      : super(key: key);

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  bool showPassword = true;

  handleShowPass() {
    return InkWell(
      onTap: () {
        setState(() => showPassword = !showPassword);
      },
      child: Text(showPassword ? "Show" : "Hide",
          style: MyFonts.boldTitle600_14_green()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
          obscureText: showPassword,
          controller: widget.textEditingController,
          textAlignVertical: TextAlignVertical.center,
          style: MyFonts.customTheme(Colors.black, FontWeight.w400, 18),
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorUtils.grey,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: ColorUtils.green,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:  BorderSide(
                  color: ColorUtils.green,
                  width: 2.0,
                ),
              ),
              labelText: widget.hint,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset("assets/images/ic_password.svg"),
              ),
              suffixIcon: IconButton(
                icon: !showPassword ? Icon(Icons.visibility_off,color: ColorUtils.grey) : Icon(Icons.visibility ,color: ColorUtils.grey,),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              ),
              hintText: widget.hint),
          onChanged: widget.onChanged,
        );

  }
}
