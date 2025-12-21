import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Constant sizes to be used in the app (paddings, gaps, rounded corners etc.)
class Sizes {
  static double p2 = 2.0.w;
  static double p4 = 4.0.w;
  static double p8 = 8.0.w;
  static double p12 = 12.0.w;
  static double p16 = 16.0.w;
  static double p20 = 20.0.w;
  static double p24 = 24.0.w;
  static double p28 = 28.0.w;
  static double p32 = 32.0.w;
  static double p36 = 36.0.w;
  static double p40 = 40.0.w;
  static double p48 = 48.0.w;
  static double p64 = 64.0.w;
  static double p80 = 80.0.w;
  static double p100 = 100.0.w;
  static double p120 = 120.0.w;
  static double p140 = 140.0.w;

  // static double p2h = 2.0.h;
  // static double p4h = 4.0.h;
  // static double p8h = 8.0.h;
  // static double p12h = 12.0.h;
  // static double p16h = 16.0.h;
  // static double p20h = 20.0.h;
  // static double p24h = 24.0.h;
  // static double p28h = 28.0.h;
  // static double p30h = 30.0.h;
  // static double p32h = 32.0.h;
  // static double p36h = 36.0.h;
  // static double p40h = 40.0.h;
  // static double p48h = 48.0.h;
  // static double p64h = 64.0.h;
  // static double p80h = 80.0.h;
  // static double p100h = 100.0.h;
  // static double p120h = 120.0.h;
  // static double p140h = 140.0.h;

  static double p2h = 2.0.w;
  static double p4h = 4.0.w;
  static double p8h = 8.0.w;
  static double p12h = 12.0.w;
  static double p16h = 16.0.w;
  static double p20h = 20.0.w;
  static double p24h = 24.0.w;
  static double p28h = 28.0.w;
  static double p30h = 30.0.w;
  static double p32h = 32.0.w;
  static double p36h = 36.0.w;
  static double p40h = 40.0.w;
  static double p48h = 48.0.w;
  static double p64h = 64.0.w;
  static double p80h = 80.0.w;
  static double p100h = 100.0.w;
  static double p120h = 120.0.w;
  static double p140h = 140.0.w;
}

class AppSizes {
  final s2 = Sizes.p2;
  final s4 = Sizes.p4;
  final s8 = Sizes.p8;
  final s12 = Sizes.p12;
  final s16 = Sizes.p16;
  final s20 = Sizes.p20;
  final s24 = Sizes.p24;
  final s28 = Sizes.p28;
  final s32 = Sizes.p32;
  final s36 = Sizes.p36;
  final s40 = Sizes.p40;
  final s48 = Sizes.p48;
  final s64 = Sizes.p64;
  final s80 = Sizes.p80;
}

class AppGap {
  /// Constant gap widths
  final w2 = SizedBox(width: Sizes.p2);
  final w4 = SizedBox(width: Sizes.p4);
  final w8 = SizedBox(width: Sizes.p8);
  final w12 = SizedBox(width: Sizes.p12);
  final w16 = SizedBox(width: Sizes.p16);
  final w20 = SizedBox(width: Sizes.p20);
  final w24 = SizedBox(width: Sizes.p24);
  final w28 = SizedBox(width: Sizes.p28);
  final w32 = SizedBox(width: Sizes.p32);
  final w36 = SizedBox(width: Sizes.p36);
  final w40 = SizedBox(width: Sizes.p40);
  final w48 = SizedBox(width: Sizes.p48);
  final w64 = SizedBox(width: Sizes.p64);
  final w80 = SizedBox(width: Sizes.p80);

  /// Constant gap heights
  final h2 = SizedBox(height: Sizes.p2h);
  final h4 = SizedBox(height: Sizes.p4h);
  final h8 = SizedBox(height: Sizes.p8h);
  final h12 = SizedBox(height: Sizes.p12h);
  final h16 = SizedBox(height: Sizes.p16h);
  final h20 = SizedBox(height: Sizes.p20h);
  final h24 = SizedBox(height: Sizes.p24h);
  final h30 = SizedBox(height: Sizes.p30h);
  final h32 = SizedBox(height: Sizes.p32h);
  final h36 = SizedBox(height: Sizes.p36h);
  final h40 = SizedBox(height: Sizes.p40h);
  final h48 = SizedBox(height: Sizes.p48h);
  final h64 = SizedBox(height: Sizes.p64h);
  final h80 = SizedBox(height: Sizes.p80h);
  final h100 = SizedBox(height: Sizes.p100h);
  final h120 = SizedBox(height: Sizes.p120h);
  final h140 = SizedBox(height: Sizes.p140h);
}

final pagePadding = EdgeInsets.symmetric(horizontal: Sizes.p16, vertical: Sizes.p20);

class AppPadding {
  /// Constant padding all
  final a2 = EdgeInsets.all(Sizes.p2);
  final a4 = EdgeInsets.all(Sizes.p4);
  final a8 = EdgeInsets.all(Sizes.p8);
  final a12 = EdgeInsets.all(Sizes.p12);
  final a16 = EdgeInsets.all(Sizes.p16);
  final a20 = EdgeInsets.all(Sizes.p20);
  final a24 = EdgeInsets.all(Sizes.p24);
  final a28 = EdgeInsets.all(Sizes.p28);
  final a32 = EdgeInsets.all(Sizes.p32);
  final a36 = EdgeInsets.all(Sizes.p36);
  final a40 = EdgeInsets.all(Sizes.p40);
  final a48 = EdgeInsets.all(Sizes.p48);
  final a64 = EdgeInsets.all(Sizes.p64);

  /// Constant horizontal padding
  final h4 = EdgeInsets.symmetric(horizontal: Sizes.p4);
  final h8 = EdgeInsets.symmetric(horizontal: Sizes.p8);
  final h12 = EdgeInsets.symmetric(horizontal: Sizes.p12);
  final h16 = EdgeInsets.symmetric(horizontal: Sizes.p16);
  final h20 = EdgeInsets.symmetric(horizontal: Sizes.p20);
  final h24 = EdgeInsets.symmetric(horizontal: Sizes.p24);
  final h28 = EdgeInsets.symmetric(horizontal: Sizes.p28);
  final h32 = EdgeInsets.symmetric(horizontal: Sizes.p32);
  final h36 = EdgeInsets.symmetric(horizontal: Sizes.p36);
  final h40 = EdgeInsets.symmetric(horizontal: Sizes.p40);
  final h48 = EdgeInsets.symmetric(horizontal: Sizes.p48);
  final h64 = EdgeInsets.symmetric(horizontal: Sizes.p64);

  /// Constant vertical padding
  final v4 = EdgeInsets.symmetric(vertical: Sizes.p4h);
  final v8 = EdgeInsets.symmetric(vertical: Sizes.p8h);
  final v12 = EdgeInsets.symmetric(vertical: Sizes.p12h);
  final v16 = EdgeInsets.symmetric(vertical: Sizes.p16h);
  final v20 = EdgeInsets.symmetric(vertical: Sizes.p20h);
  final v24 = EdgeInsets.symmetric(vertical: Sizes.p24h);
  final v28 = EdgeInsets.symmetric(vertical: Sizes.p28h);
  final v32 = EdgeInsets.symmetric(vertical: Sizes.p32h);
  final v36 = EdgeInsets.symmetric(vertical: Sizes.p36h);
  final v40 = EdgeInsets.symmetric(vertical: Sizes.p40h);
  final v48 = EdgeInsets.symmetric(vertical: Sizes.p48h);
  final v64 = EdgeInsets.symmetric(vertical: Sizes.p64h);

  /// Constant top padding
  final t4 = EdgeInsets.only(top: Sizes.p4h);
  final t8 = EdgeInsets.only(top: Sizes.p8h);
  final t12 = EdgeInsets.only(top: Sizes.p12h);
  final t16 = EdgeInsets.only(top: Sizes.p16h);
  final t20 = EdgeInsets.only(top: Sizes.p20h);
  final t24 = EdgeInsets.only(top: Sizes.p24h);
  final t28 = EdgeInsets.only(top: Sizes.p28h);
  final t32 = EdgeInsets.only(top: Sizes.p32h);
  final t36 = EdgeInsets.only(top: Sizes.p36h);
  final t40 = EdgeInsets.only(top: Sizes.p40h);
  final t48 = EdgeInsets.only(top: Sizes.p48h);
  final t64 = EdgeInsets.only(top: Sizes.p64h);

  /// Constant bottom padding
  final b4 = EdgeInsets.only(bottom: Sizes.p4h);
  final b8 = EdgeInsets.only(bottom: Sizes.p8h);
  final b12 = EdgeInsets.only(bottom: Sizes.p12h);
  final b16 = EdgeInsets.only(bottom: Sizes.p16h);
  final b20 = EdgeInsets.only(bottom: Sizes.p20h);
  final b24 = EdgeInsets.only(bottom: Sizes.p24h);
  final b28 = EdgeInsets.only(bottom: Sizes.p28h);
  final b32 = EdgeInsets.only(bottom: Sizes.p32h);
  final b36 = EdgeInsets.only(bottom: Sizes.p36h);
  final b40 = EdgeInsets.only(bottom: Sizes.p40h);
  final b48 = EdgeInsets.only(bottom: Sizes.p48h);
  final b64 = EdgeInsets.only(bottom: Sizes.p64h);

  /// Constant right padding
  final r4 = EdgeInsets.only(right: Sizes.p4);
  final r8 = EdgeInsets.only(right: Sizes.p8);
  final r12 = EdgeInsets.only(right: Sizes.p12);
  final r16 = EdgeInsets.only(right: Sizes.p16);
  final r20 = EdgeInsets.only(right: Sizes.p20);
  final r24 = EdgeInsets.only(right: Sizes.p24);
  final r28 = EdgeInsets.only(right: Sizes.p28);
  final r32 = EdgeInsets.only(right: Sizes.p32);
  final r36 = EdgeInsets.only(right: Sizes.p36);
  final r40 = EdgeInsets.only(right: Sizes.p40);
  final r48 = EdgeInsets.only(right: Sizes.p48);
  final r64 = EdgeInsets.only(right: Sizes.p64);

  /// Constant left padding
  final l4 = EdgeInsets.only(left: Sizes.p4);
  final l8 = EdgeInsets.only(left: Sizes.p8);
  final l12 = EdgeInsets.only(left: Sizes.p12);
  final l16 = EdgeInsets.only(left: Sizes.p16);
  final l20 = EdgeInsets.only(left: Sizes.p20);
  final l24 = EdgeInsets.only(left: Sizes.p24);
  final l28 = EdgeInsets.only(left: Sizes.p28);
  final l32 = EdgeInsets.only(left: Sizes.p32);
  final l36 = EdgeInsets.only(left: Sizes.p36);
  final l40 = EdgeInsets.only(left: Sizes.p40);
  final l48 = EdgeInsets.only(left: Sizes.p48);
  final l64 = EdgeInsets.only(left: Sizes.p64);
}

/// Constant Circular Radius
class AppBorderRadius {
  final br4 = BorderRadius.circular(Sizes.p4);
  final br8 = BorderRadius.circular(Sizes.p8);
  final br12 = BorderRadius.circular(Sizes.p12);
  final br16 = BorderRadius.circular(Sizes.p16);
  final br20 = BorderRadius.circular(Sizes.p20);
  final br24 = BorderRadius.circular(Sizes.p24);
  final br28 = BorderRadius.circular(Sizes.p28);
  final br32 = BorderRadius.circular(Sizes.p32);
  final br36 = BorderRadius.circular(Sizes.p36);
  final br40 = BorderRadius.circular(Sizes.p40);
  final br48 = BorderRadius.circular(Sizes.p48);
  final br64 = BorderRadius.circular(Sizes.p64);
}
