import '../graph.dart';
import '../tree_iterators/breadth_first_iterator.dart';
import '../tree_iterators/itree_iterator.dart';
import 'itree_collection.dart';

class BreadthFirstTreeCollection implements ITreeCollection {
  // we need graph class to use addEdge method for selected collection
  final Graph graph;
  const BreadthFirstTreeCollection(this.graph);

  // we inherit method createIterator() to create suitable iterator for selected collection
  // we will create iterator that matching this collection
  // breadth first iterator for breadth first collection
  @override
  ITreeIterator createIterator() => BreadthFirstIterator(this);

  @override
  String getTitle() => 'Breadth-first';
}
