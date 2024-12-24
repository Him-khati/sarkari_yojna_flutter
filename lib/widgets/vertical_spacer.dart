import 'package:flutter/material.dart';

class VerticalSpacer {
  static Widget get(double space){
    return SizedBox( height: space);
  }

  static Widget getSmall(){ return get(6); }
  static Widget getNormal(){ return get(12); }
  static Widget getLarge(){ return get(24); }
}
