import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/color_utils.dart';


class CustomButtonWithIcon extends StatefulWidget {
  bool isLoading;
  String title;
  Function onPress;

  CustomButtonWithIcon(
      {Key? key,
      required this.isLoading,
      required this.title,
      required this.onPress})
      : super(key: key);

  @override
  State<CustomButtonWithIcon> createState() => _CustomButtonWithIconState();
}

class _CustomButtonWithIconState extends State<CustomButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.isLoading ? null : widget.onPress();
      },
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
           /* boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: ColorUtils.primary.withOpacity(0.5), //New
              ),
            ],*/
            color: widget.isLoading
                ?  ColorUtils.primary.withOpacity(0.4)
                :  ColorUtils.primary,
            border: Border.all(
              color: widget.isLoading
                  ?  ColorUtils.primary.withOpacity(0.4)
                  :  ColorUtils.primary,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: widget.isLoading
            ? Center(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ),
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/images/person.svg"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SvgPicture.asset("assets/images/vertical_line.svg"),
                    ),
                    Text(widget.title,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white))),
                  ],
                ),
              ),
      ),
    );
  }
}
