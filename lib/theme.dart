import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  TextTheme tajawalTextTheme() => TextTheme(
      headline6: GoogleFonts.tajawal(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.black),

      /// used for number in MixerCard
      bodyText1: GoogleFonts.tajawal(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          letterSpacing: 5,
          color: Colors.blue),
      // used in ShipmentCardRow
      bodyText2: GoogleFonts.tajawal(
          fontSize: 30,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.black),

      /// used for number in MixerCard
      button: GoogleFonts.tajawal(
        fontSize: 16,
        color: Colors.white,
      ),
      // for errors
      caption: GoogleFonts.tajawal(
        fontSize: 30,
        color: Colors.redAccent,
        fontWeight: FontWeight.bold,
      ));
}

class MyIconTheme {
  IconThemeData shipmentCardIconTheme() => IconThemeData(
        color: Colors.blue,
        size: 40,
      );
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
