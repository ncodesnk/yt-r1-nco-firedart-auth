import 'package:flutter/material.dart';

import 'package:nco_app/styles/colors/colors.dart';

var clockTime =  TextStyle(
  fontSize: 60.0,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
  letterSpacing: 5.0,
  shadows: <Shadow>[
    Shadow(
      offset: const Offset(4.0, -2.0),
      blurRadius: 2.0,
      color: color2,
    ),
    Shadow(
      offset: const Offset(6.0, -4.0),
      blurRadius: 1.0,
      color: color3
    ),
  ],
  decoration: TextDecoration.underline,
  decorationColor: color4,
  decorationStyle: TextDecorationStyle.solid
);

var clockDate =  TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
  fontStyle: FontStyle.italic,
  letterSpacing: 2.0,
  shadows: <Shadow>[
    Shadow(
      offset: const Offset(2.0, -2.0),
      blurRadius: 2.0,
      color: color2,
    ),
    Shadow(
      offset: const Offset(4.0, -1.0),
      blurRadius: 1.0,
      color: color3
    ),
  ],
);