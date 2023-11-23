import 'package:flutter/widgets.dart';

import 'ivisitor.dart';

// this is abstract class to original classes that we need to add new behavior to it
// it has method accept with parameter of visitor (has new behavior)
abstract interface class IFile {
  int getSize();
  Widget render(BuildContext context);
  String accept(IVisitor visitor);
}
