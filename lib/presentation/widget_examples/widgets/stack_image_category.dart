import 'package:flutter/material.dart';

import '../../../main.dart';

Stack categoryWidget(CategoryQuestion iCategory) {
  String lPathImageFromCat = "unnamed.png";
  switch (iCategory) {
    case CategoryQuestion.education:
      lPathImageFromCat = iCategory.getPictureName();
      break;
    case CategoryQuestion.geography:
      lPathImageFromCat = iCategory.getPictureName();
      break;
    case CategoryQuestion.sport:
      lPathImageFromCat = iCategory.getPictureName();
      break;
    default:
      lPathImageFromCat = iCategory.getPictureName();
  }

  return Stack(children: [
    Image.asset('assets/$lPathImageFromCat'),
    Center(child: Text(iCategory.name))
  ]);
}
