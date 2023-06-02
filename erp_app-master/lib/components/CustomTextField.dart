import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../MyFonts.dart';
import '../utils/color_utils.dart';

class CustomTextField extends StatefulWidget {
  final validator;
  final controller;
  final focusNode;
  final prefixIcon;
  final hint;
  final keyboardType;
  final textEditingController;
  final obscureText;
  final onChanged;
  String svgIcon;

  CustomTextField(
      {Key? key,
      this.validator,
      this.controller,
      this.prefixIcon,
      this.hint,
      this.keyboardType,
      this.focusNode,
      this.textEditingController,
      this.obscureText,
      this.onChanged,
      required this.svgIcon})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  handleShowPass() {
    return IconButton(
      icon: showPassword
          ? Icon(Icons.remove_red_eye, color: Colors.white, size: 20)
          : Icon(Icons.visibility_off, color: Colors.white, size: 20),
      color: ColorUtils.primary,
      onPressed: () {
        setState(() => showPassword = !showPassword);
      },
    );
  }

  String? _validator(value) {
    if (widget.obscureText) {
      if (value == null || value.isEmpty) {
        return 'type a ${widget.hint}';
      }
      return null;
    } else {
      if (value == null || value.isEmpty) {
        return 'type a ${widget.hint}';
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
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
          prefixIcon: Padding(
            padding: const EdgeInsets.all(18.0),
            child: SvgPicture.asset(
              widget.svgIcon,
              height: 30,
            ),
          ),
          labelText: widget.hint,
          errorStyle: const TextStyle(color: Colors.black, fontSize: 14),
          hintText: widget.hint),
      focusNode: widget.focusNode,
      validator: widget.validator,
      controller: widget.textEditingController,
      style: MyFonts.customTheme(Colors.black, FontWeight.w400, 18),
      cursorColor: Colors.black,
      obscureText: widget.obscureText ? !showPassword : false,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
    );
  }
}
