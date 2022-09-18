import 'package:flutter/material.dart';

Gradient gradient() => const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.lightBlueAccent,
        Colors.black,
        Colors.lightBlueAccent,
      ],
    );
