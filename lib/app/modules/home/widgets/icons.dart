import "package:flutter/material.dart";

import '../../../core/constants/colors.dart';
import '../../../core/constants/icons.dart';

List<Icon> getIcons() {
  return const [
    Icon(
      IconData(
        personIcon,
        fontFamily: 'MaterialIcons',
      ),
      color: kIndigoShade,
    ),
    Icon(
      IconData(
        workIcon,
        fontFamily: 'MaterialIcons',
      ),
      color: kPink,
    ),
    Icon(
      IconData(
        movieIcon,
        fontFamily: 'MaterialIcons',
      ),
      color: kOrange,
    ),
    Icon(
      IconData(
        sportIcon,
        fontFamily: 'MaterialIcons',
      ),
      color: kTeal,
    ),
    Icon(
      IconData(
        travelIcon,
        fontFamily: 'MaterialIcons',
      ),
      color: kBlueShade,
    ),
    Icon(
      IconData(
        shopIcon,
        fontFamily: 'MaterialIcons',
      ),
      color: kPinkShade,
    ),
  ];

  // return const [
  //   Icon(
  //     Icons.person,
  //     color: kIndigoShade,
  //   ),
  //   Icon(
  //     Icons.work,
  //     color: kPink,
  //   ),
  //   Icon(
  //     Icons.movie,
  //     color: kOrange,
  //   ),
  //   Icon(
  //     Icons.sports,
  //     color: kTeal,
  //   ),
  //   Icon(
  //     Icons.mode_of_travel,
  //     color: kBlueShade,
  //   ),
  //   Icon(
  //     Icons.shopify,
  //     color: kPinkShade,
  //   ),
  // ];
}
