import 'package:flutter/material.dart';

import '../file.dart';
import '../ivisitor.dart';

class VideoFile extends File {
  final String directedBy;

  // initial icon movie
  const VideoFile({
    required this.directedBy,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.movie);

  // call tne new behavior from visitor (human_readable or xml visitors)
  @override
  String accept(IVisitor visitor) => visitor.visitVideoFile(this);
}
