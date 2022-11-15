import 'package:diversity_challenge/utils/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Titles{
  static Widget titleWithIcon(String title, Function iconButton) {
    return Row(
      children: [
        Text(title, style: TextStyles.heading1),
        IconButton(
          onPressed: () => iconButton,
          icon: Icon(Icons.add_circle_rounded),
        )
      ],
    );
  }
}