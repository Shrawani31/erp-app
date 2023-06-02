
import 'package:erp_app/MyFonts.dart';
import 'package:flutter/material.dart';

class RoundedCornerButton extends StatefulWidget {
   String name;
   VoidCallback onPressed;
  RoundedCornerButton({Key? key , required this.name,required this.onPressed}) : super(key: key);

  @override
  State<RoundedCornerButton> createState() => _RoundedCornerButtonState();
}

class _RoundedCornerButtonState extends State<RoundedCornerButton> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap:() =>
      widget.onPressed(),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.green,
          borderRadius: BorderRadius.all(
          Radius.circular(30)
          ),
        ),
        child: Center(
          child: Text(
            widget.name,
            style: MyFonts.boldTitle18(),
          ),
        ),
      ),
    );
  }
}
