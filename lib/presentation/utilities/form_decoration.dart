import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration inputsDecoration(
      {required String labelText, required String hintText}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black12, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF129B64), width: 2),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      hintText: hintText,
      label: Text(labelText),
      labelStyle: const TextStyle(
          color: Color(0xFF129B64), fontSize: 19, fontWeight: FontWeight.w500),
      floatingLabelStyle: const TextStyle(
          color: Color(0xFF129B64), fontSize: 19, fontWeight: FontWeight.w500),
      hintStyle: const TextStyle(
          color: Colors.black38, fontSize: 19, fontWeight: FontWeight.w500),
    );
  }
}
