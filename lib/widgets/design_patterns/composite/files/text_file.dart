import 'package:flutter/material.dart';

import 'file.dart';

final class TextFile extends File {
  // inherit constructor with default value for icon
  const TextFile({
    required super.title,
    required super.size,
  }) : super(icon: Icons.description);
}
