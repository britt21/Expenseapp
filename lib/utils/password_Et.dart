import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/colors.dart';


class passEt extends StatefulWidget {
  final TextEditingController etcontroller;
  final String tophint;
  final String innerhint;
  final String eticon;

  passEt({
    required this.etcontroller,
    required this.eticon,
    required this.tophint,
    required this.innerhint,
  });

  @override
  State<passEt> createState() => _passEtState();
}

class _passEtState extends State<passEt> {
  bool _isPasswordVisible = false;

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
                child: Text(
                  widget.tophint,
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: etbg2, // Replace `etbg2` with a color
              borderRadius: BorderRadius.circular(6),
            ),
            height: 50,
            child: TextField(
              controller: widget.etcontroller,
              obscureText: !_isPasswordVisible, // Toggle visibility
              style: GoogleFonts.inter(color: Colors.black, fontSize: 13),
              decoration: InputDecoration(
                icon: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SvgPicture.asset(widget.eticon),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                contentPadding: EdgeInsets.only(left: 0.0,top: 15),

                hintText: widget.innerhint,
                hintStyle: GoogleFonts.inter(color: Colors.grey),
                border: InputBorder.none, // Hide the underline
              ),
            ),
          ),
        ],
      ),
    );
  }
}
