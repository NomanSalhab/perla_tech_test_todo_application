import 'package:flutter/material.dart';

import '../../constants/colors.dart';

void errorSnackBar(String text, BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.red,
    elevation: 5.0,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void successSnackBar(String text, BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: Text(
      text,
      style: const TextStyle(color: blueColor, fontWeight: FontWeight.bold),
    ),
    elevation: 5.0,
    backgroundColor: Colors.white,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
