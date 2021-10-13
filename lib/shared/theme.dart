import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const blueColor = Color(0xFF28A0F6);
const blackColor = Color(0xFF000000);
const greyColor = Color(0xFF353D49);
const pinkColor = Color(0xFFE91E63);
const whiteColor = Color(0xFFF5F5F5);

const redColor = Color(0xFFFF5722);

// Noted GlobalFontWeight
FontWeight light = FontWeight.w300;
FontWeight normal = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

TextStyle blueTextFont =
    GoogleFonts.nunito(color: blueColor, fontWeight: normal, fontSize: 15);

TextStyle blackTextFont =
    GoogleFonts.nunito(color: blackColor, fontWeight: normal, fontSize: 15);

TextStyle greyTextFont =
    GoogleFonts.nunito(color: greyColor, fontWeight: normal, fontSize: 15);

TextStyle whiteTextFont =
    GoogleFonts.nunito(color: whiteColor, fontWeight: normal, fontSize: 15);

TextStyle blackLightTextFont = blackTextFont.copyWith(fontWeight: light);
