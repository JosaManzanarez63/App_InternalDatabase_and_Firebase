import 'dart:io';

import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  String? path;

  ImageWidget({Key? key, this.path}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    if(widget.path == '') {
      return Placeholder();
    }
    else {
      return Image.file(File(widget.path!));
    }
  }
}