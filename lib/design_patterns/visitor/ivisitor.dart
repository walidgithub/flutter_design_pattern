import 'directory.dart';
import 'files/index.dart';

// this the abstract class visitor that has another behavior to add to original class (directory or audio or image or text or video)
// we will send an object from original class as a parameter to visitor
abstract interface class IVisitor {
  String getTitle();
  String visitDirectory(Directory directory);
  String visitAudioFile(AudioFile file);
  String visitImageFile(ImageFile file);
  String visitTextFile(TextFile file);
  String visitVideoFile(VideoFile file);
}
