
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../assets/svgs/svg.dart';
import '../colors/colors.dart';


class AppEditText extends StatefulWidget {
  final etcontroller;
  final ethint;

  AppEditText({this.etcontroller, this.ethint});

  @override
  State<AppEditText> createState() => _AppEditTextState();
}

class _AppEditTextState extends State<AppEditText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text("Your Name",style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: etbg2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              height: 50,
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: hintgrey),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),

                    child: SvgPicture.asset(userimg),
                  ),

                  contentPadding: EdgeInsets.only(left: 0.0),
                  hintText: widget.ethint,
                  border: InputBorder.none, // Hide the underline

                ),
              )),
        ],
      ),
    );
  }
}



class AppEditTextNoHint extends StatefulWidget {
  final etcontroller;
  final ethint;
  final eticon;
  AppEditTextNoHint({this.etcontroller, this.ethint, this.eticon});

  @override
  State<AppEditTextNoHint> createState() => _AppEditTextNoHintState();
}

class _AppEditTextNoHintState extends State<AppEditTextNoHint> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        children: [

          Container(
              decoration: BoxDecoration(
                  color: etbg2,
                  border: Border.all(width: 0.1,color: etbgline),
                  borderRadius: BorderRadius.circular(12)),
              height: 45,
              width: 270,
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 12.0),

                    child: SvgPicture.asset(widget.eticon),
                  ),

                  contentPadding: EdgeInsets.only(left: 0.0),
                  hintText: widget.ethint,
                  border: InputBorder.none, // Hide the underline

                ),
              )),
        ],
      ),
    );
  }
}



class EtMap extends StatefulWidget {
  final etcontroller;
  final ethint;
  final eticon;
  EtMap({this.etcontroller, this.ethint, this.eticon});

  @override
  State<EtMap> createState() => _EtMapState();
}

class _EtMapState extends State<EtMap> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        children: [

          Container(
              decoration: BoxDecoration(
                  color: etbg2,
                  border: Border.all(width: 0.1,color: etbgline),
                  borderRadius: BorderRadius.circular(12)),
              height: 45,
              width: 280,
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Color(0xD56E7E91)),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 12.0),

                    child: SvgPicture.asset(widget.eticon),
                  ),

                  contentPadding: EdgeInsets.only(left: 0.0),
                  hintText: widget.ethint,
                  border: InputBorder.none, // Hide the underline

                ),
              )),
        ],
      ),
    );
  }
}



class AppEditTextIcon extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;

  AppEditTextIcon({this.etcontroller, this.eticon, this.tophint, this.innerhint});

  @override
  _AppEditTextIconState createState() => _AppEditTextIconState();
}


class _AppEditTextIconState extends State<AppEditTextIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: etbg2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              height: 50,
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black,fontSize: 13),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),

                    child: SvgPicture.asset(widget.eticon),
                  ),

                  contentPadding: EdgeInsets.only(left: 0.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: hintgrey),
                  border: InputBorder.none, // Hide the underline

                ),
              )),
        ],
      ),
    );
  }
}



class AppEditTextPhoneIcon extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;

  AppEditTextPhoneIcon({this.etcontroller, this.eticon, this.tophint, this.innerhint});

  @override
  State<AppEditTextPhoneIcon> createState() => _AppEditTextPhoneIconState();
}

class _AppEditTextPhoneIconState extends State<AppEditTextPhoneIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: etbg2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              height: 50,
              child: TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,

                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black,fontSize: 13),
                decoration: InputDecoration(
                  counterText: "",
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8.0),

                    child: SvgPicture.asset(widget.eticon),
                  ),

                  contentPadding: EdgeInsets.only(left: 0.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: hintgrey),
                  border: InputBorder.none,

                ),
              )),
        ],
      ),
    );
  }
}


class edittexticonright extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;
  final textright;


  edittexticonright({this.etcontroller, this.eticon, this.tophint, this.innerhint, this.textright});

  @override
  State<edittexticonright> createState() => _edittexticonrightState();
}

class _edittexticonrightState extends State<edittexticonright> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: etbg2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              height: 50,
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black,fontSize: 13),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 15.0),

                    child: SvgPicture.asset(widget.eticon),
                  ),

                  contentPadding: EdgeInsets.only(left: 0.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: hintgrey),
                  border: InputBorder.none, // Hide the underline

                ),
              )),
        ],
      ),
    );
  }
}




class edittexticonallright extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;
  final textright;

  edittexticonallright({this.etcontroller, this.eticon, this.tophint, this.innerhint, this.textright});

  @override
  State<edittexticonallright> createState() => _edittexticononrightState();
}

class _edittexticononrightState extends State<edittexticonallright> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: etbg2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6), topLeft: Radius.circular(6))),
              height: 50,
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black,fontSize: 13),
                decoration: InputDecoration(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 5.0),

                  ),
                  contentPadding: EdgeInsets.only(top: 15.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: hintgrey),
                  border: InputBorder.none,
                  suffixIcon: Container(
                    height: 20, // Container size
                    width: 20,
                    child: FittedBox(
                      child: SvgPicture.asset(
                        widget.eticon,
                        width: 15, // Icon size
                        height: 15,
                      ),
                    ),
                  ),



                ),

              )),
        ],
      ),
    );
  }
}






class AppEditTextRight extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;

  AppEditTextRight({this.etcontroller, this.eticon, this.tophint, this.innerhint});

  @override
  State<AppEditTextRight> createState() => _AppEditTextRightState();
}

class _AppEditTextRightState extends State<AppEditTextRight> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: etbg2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6),
                topLeft: Radius.circular(6),
              ),
            ),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 13),
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: SvgPicture.asset(widget.eticon),
                  ),
                  contentPadding: EdgeInsets.only(left: 8.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: hintgrey, fontSize: 13),
                  border: InputBorder.none, // Hide the underline
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}




class AppEditTextRightNotouch extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;

  AppEditTextRightNotouch({this.etcontroller, this.eticon, this.tophint, this.innerhint});

  @override
  State<AppEditTextRightNotouch> createState() => _AppEditTextRightNotouchState();
}

class _AppEditTextRightNotouchState extends State<AppEditTextRightNotouch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: etbg2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6),
                topLeft: Radius.circular(6),
              ),
            ),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enabled: false,
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 13),
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                    child: SvgPicture.asset(widget.eticon),
                  ),
                  contentPadding: EdgeInsets.only(left: 8.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: Colors.black, fontSize: 13),
                  border: InputBorder.none, // Hide the underline
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}




class AppEditTextRightNoIcon extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;

  AppEditTextRightNoIcon({this.etcontroller, this.eticon, this.tophint, this.innerhint});

  @override
  State<AppEditTextRightNoIcon> createState() => _AppEditTextRightNoIconState();
}

class _AppEditTextRightNoIconState extends State<AppEditTextRightNoIcon> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: etbg2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6),
                topLeft: Radius.circular(6),
              ),
            ),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 13),
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                  ),
                  contentPadding: EdgeInsets.only(left: 8.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: hintgrey, fontSize: 13),
                  border: InputBorder.none,

                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}



class AppEditTextLimit extends StatefulWidget {
  final etcontroller;
  final ethint;

  AppEditTextLimit({this.etcontroller, this.ethint});

  @override
  State<AppEditTextLimit> createState() => _AppEditTextLimitState();
}

class _AppEditTextLimitState extends State<AppEditTextLimit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
          padding: EdgeInsets.only(bottom: 8,right: 5),
          decoration: BoxDecoration(
              color: etbg2,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6), topLeft: Radius.circular(6))),
          height: 50,
          child: TextField(
            controller: widget.etcontroller,
            style: TextStyle(fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10.0),
                hintText: widget.ethint,
                border: InputBorder.none
            ),
            maxLength: 14,
          )),

    );
  }
}


class edittextnumber extends StatefulWidget {
  final etcontroller;
  final tophint;
  final innerhint;
  final eticon;

  edittextnumber({this.etcontroller, this.eticon, this.tophint, this.innerhint});

  @override
  State<edittextnumber> createState() => _edittextnumberState();
}

class _edittextnumberState extends State<edittextnumber> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(widget.tophint,style: GoogleFonts.inter(color: hintgrey),),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: etbg2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(6),
                topLeft: Radius.circular(6),
              ),
            ),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: widget.etcontroller,
                style: GoogleFonts.inter(color: Colors.black, fontSize: 13),
                keyboardType: TextInputType.number, // Restrict keyboard to numbers
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 28.0),
                  ),
                  contentPadding: EdgeInsets.only(left: 8.0),
                  hintText: widget.innerhint,
                  hintStyle: GoogleFonts.inter(color: hintgrey, fontSize: 13),
                  border: InputBorder.none,
                ),
              ),

            ),
          )

        ],
      ),
    );
  }
}

