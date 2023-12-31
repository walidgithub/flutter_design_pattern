import 'package:flutter/material.dart';

import 'file.dart';

final class AudioFile extends File {
  // inherit constructor with default value for icon
  const AudioFile({
    required super.title,
    required super.size,
  }) : super(icon: Icons.music_note);
}
