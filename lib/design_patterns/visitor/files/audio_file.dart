import 'package:flutter/material.dart';

import '../file.dart';
import '../ivisitor.dart';

class AudioFile extends File {
  final String albumTitle;

  // initial icon music_note
  const AudioFile({
    required this.albumTitle,
    required super.title,
    required super.fileExtension,
    required super.size,
  }) : super(icon: Icons.music_note);

  // call tne new behavior from visitor (human_readable or xml visitors)
  @override
  String accept(IVisitor visitor) => visitor.visitAudioFile(this);
}
