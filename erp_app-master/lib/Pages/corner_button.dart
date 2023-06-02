
import 'package:erp_app/MyFonts.dart';
import 'package:flutter/material.dart';

class CornerButton extends StatefulWidget {
  final String name;
  final VoidCallback? onPressed;
  const CornerButton({Key? key , required this.name,required this.onPressed}) : super(key: key);

  @override
  State<CornerButton> createState() => _CornerButtonState();
}

class _CornerButtonState extends State<CornerButton> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.green,
          borderRadius: BorderRadius.all(
          Radius.circular(15)
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
