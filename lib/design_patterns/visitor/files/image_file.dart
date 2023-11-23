import 'package:flutter/material.dart';

import '../file.dart';
import '../ivisitor.dart';

class ImageFile extends File {
  final String resolution;

  // initial icon image
  const ImageFile({
    required this.resolution,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.image);

  // call tne new behavior from visitor (human_readable or xml visitors)
  @override
  String accept(IVisitor visitor) => visitor.visitImageFile(this);
}
