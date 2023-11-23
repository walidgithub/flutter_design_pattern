import 'package:flutter/material.dart';

import '../file.dart';
import '../ivisitor.dart';

class TextFile extends File {
  final String content;

  // initial icon description
  const TextFile({
    required this.content,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.description);

  // call tne new behavior from visitor (human_readable or xml visitors)
  @override
  String accept(IVisitor visitor) => visitor.visitTextFile(this);
}
