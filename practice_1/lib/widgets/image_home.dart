import 'dart:io';

import 'package:flutter/material.dart';

class ImageHome extends StatefulWidget {
  String? path;

  ImageHome({Key? key, this.path}) : super(key: key);

  @override
  State<ImageHome> createState() => _ImageHomeState();
}

class _ImageHomeState extends State<ImageHome> {
  @override
  Widget build(BuildContext context) {
    if(widget.path == '') {
      return Placeholder(
        fallbackHeight: 100,
        fallbackWidth: 100,
      );
    }
    else {
      return Image.file(File(widget.path!));
    }
  }
}