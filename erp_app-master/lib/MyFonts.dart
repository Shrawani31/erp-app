
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts
{

   static TextStyle boldTitle20() =>  GoogleFonts.poppins(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500);
   static TextStyle boldTitle18() =>  GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500);
   static TextStyle boldTitle600_14_black() =>  GoogleFonts.poppins(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w600);
   static TextStyle boldTitle600_14_black_underline() =>  GoogleFonts.poppins(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w400,textStyle: TextStyle(decoration:  TextDecoration.underline));
   static TextStyle boldTitle600_14_green() =>  GoogleFonts.poppins(color: Colors.green,fontSize: 14,fontWeight: FontWeight.w600);
   static TextStyle customTheme(Color color,FontWeight fontWeight, double fontSize,) =>  GoogleFonts.poppins(color: color,fontSize: fontSize,fontWeight: fontWeight);

}