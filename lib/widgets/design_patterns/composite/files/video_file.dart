import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/composite/files/file.dart';

final class VideoFile extends File {
  // inherit constructor with default value for icon
  const VideoFile({
    required super.title,
    required super.size,
  }) : super(icon: Icons.movie);
}
