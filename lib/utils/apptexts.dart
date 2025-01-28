import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';

Widget appbutton(text) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: app_blu_drk),
      height: 53,
      child: Center(child: apptextdrkboldmid(text, 15.0,Colors.white)),
    ),
  );
}

Widget AppbuttonRev(text) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: app_blu, width: 0.8),
        borderRadius: BorderRadius.circular(7),
      ),
      height: 50,
      child: Center(child: apptextcstbold(text, 14.0, app_blu)),
    ),
  );
}

Widget AppbuttonBold(text) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0),
    child: Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(7), color: app_blu),
      height: 50,
      child: Center(child: apptextbld(text)),
    ),
  );
}

Widget apptext(text) {
  return Text("${text}",
      style: GoogleFonts.inter(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: 14));
}

Widget apptextbld(text) {
  return Text("${text}",
      style: GoogleFonts.roboto(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14));
}

Widget apptextdrk(text, size) {
  return Text("${text}",
      style: GoogleFonts.inter(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: size));
}

Widget apptextdrkstrt(text, size) {
  return Text(
    "${text}",
    style: GoogleFonts.inter(
        color: Colors.black, fontWeight: FontWeight.w400, fontSize: size),
    textAlign: TextAlign.center,
  );
}

Widget apptextlitdrk(text, size) {
  return Text("${text}",
      style: GoogleFonts.inter(
          color: hintgrey, fontWeight: FontWeight.w400, fontSize: size));
}

Widget apptextdrkboldcst(text, size,color,bool isCentered) {
  return Text("${text}",
      textAlign: isCentered ? TextAlign.center : TextAlign.start, // Center or align to start
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w800, fontSize: size));
}



Widget textcst(text, size,color,bool isCentered) {
  return Text("${text}",
      textAlign: isCentered ? TextAlign.center : TextAlign.start, // Center or align to start
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w400, fontSize: size));
}

Widget textmidcst(text, size,color,bool isCentered) {
  return Text("${text}",
      textAlign: isCentered ? TextAlign.center : TextAlign.start, // Center or align to start
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w500, fontSize: size));
}



Widget textboldcst(text, size,color,bool isCentered) {
  return Text("${text}",
      textAlign: isCentered ? TextAlign.center : TextAlign.start, // Center or align to start
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w800, fontSize: size));
}




Widget apptextdrkcst(text, size, color) {
  return Text("${text}",
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w600, fontSize: size));
}

Widget apptextdrkboldstrt(text, size) {
  return Text("${text}",
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: size));
}


Widget apptextdrkboldmid(text, size,color) {
  return Text("${text}",
      textAlign: TextAlign.center,
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w700, fontSize: size));
}



Widget apptextwht(text, size) {
  return Text("${text}",
      style: GoogleFonts.inter(
          color: Colors.white, fontWeight: FontWeight.w400, fontSize: size));
}

Widget apptextcst(text, size, color) {
  return Text("${text}",
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w400, fontSize: size));
}

Widget apptextcstbold(text, size, color) {
  return Text("${text}",
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w600, fontSize: size));
}

Widget apptextcstboldest(text, size, color) {
  return Text("${text}",
      style: GoogleFonts.inter(
          color: color, fontWeight: FontWeight.w800, fontSize: size));
}
