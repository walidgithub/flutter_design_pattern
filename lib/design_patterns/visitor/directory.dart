import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../helpers/file_size_converter.dart';
import 'ifile.dart';
import 'ivisitor.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final int level;
  final bool isInitiallyExpanded;

  // directory has list of IFile
  final List<IFile> _files = [];

  // return list of IFile
  List<IFile> get files => _files;

  Directory({
    required this.title,
    required this.level,
    this.isInitiallyExpanded = false,
  });

  // add IFile to list
  void addFile(IFile file) => _files.add(file);

  // return all directory size
  @override
  int getSize() {
    var sum = 0;
    for (final file in _files) {
      sum += file.getSize();
    }
    return sum;
  }

  // directory UI
  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(primary: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: LayoutConstants.paddingS),
        child: ExpansionTile(
          leading: const Icon(Icons.folder),
          title: Text('$title (${FileSizeConverter.bytesToString(getSize())})'),
          initiallyExpanded: isInitiallyExpanded,
          children: _files.map((IFile file) => file.render(context)).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => render(context);

  // call tne new behavior from visitor (human_readable or xml visitors)
  @override
  String accept(IVisitor visitor) => visitor.visitDirectory(this);
}
