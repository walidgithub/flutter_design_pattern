import '../graph.dart';
import '../tree_iterators/depth_first_iterator.dart';
import '../tree_iterators/itree_iterator.dart';
import 'itree_collection.dart';

class DepthFirstTreeCollection implements ITreeCollection {
  // we need graph class to use addEdge method for selected collection
  final Graph graph;
  const DepthFirstTreeCollection(this.graph);

  // we inherit method createIterator() to create suitable iterator for selected collection
  // we will create iterator that matching this collection
  // depth first iterator for depth first collection
  @override
  ITreeIterator createIterator() => DepthFirstIterator(this);

  @override
  String getTitle() => 'Depth-first';
}
