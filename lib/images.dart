

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget addimage(asset) {
  return Image.asset(asset);
}

Widget addNetworkImage(String url) {
  return Image.network(url);
}

Widget addsvg(asset) {
  return SvgPicture.asset(asset);
}