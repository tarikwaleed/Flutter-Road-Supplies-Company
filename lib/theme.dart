import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  TextTheme tajawalTextTheme() => TextTheme(
      headline6: GoogleFonts.tajawal(
          fontSize: 23,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.black),
      bodyText1: GoogleFonts.tajawal(
          fontSize: 19,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.blueGrey),
      bodyText2: GoogleFonts.tajawal(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.blueGrey),
      button: GoogleFonts.tajawal(
        fontSize: 16,
        color: Colors.white,
      ),
      // for Cards
      caption: GoogleFonts.tajawal(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ));
}

class MyInputDecorationTheme {
  InputDecorationTheme myInputDecorationTheme() => InputDecorationTheme(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        disabledBorder: _buildOutlineInputBorder(Colors.blueGrey),
        enabledBorder: _buildOutlineInputBorder(Colors.grey),
        focusedBorder: _buildOutlineInputBorder(Colors.blue),
        errorBorder: _buildOutlineInputBorder(Colors.red),
        focusedErrorBorder: _buildOutlineInputBorder(Colors.orangeAccent),
        errorStyle: _buildTextStyle(Colors.red),
      );

  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
  }

  TextStyle _buildTextStyle(Color color, {double size = 16.0}) {
    return TextStyle(
      color: color,
      fontSize: size,
    );
  }
}
