import 'dart:collection';

import '../tree_collections/depth_first_tree_collection.dart';
import 'itree_iterator.dart';

class DepthFirstIterator implements ITreeIterator {
  // object for selected collection
  final DepthFirstTreeCollection treeCollection;

  // Set of visited nodes
  final Set<int> visitedNodes = <int>{};

  // listQueue let us use addFirst(), addLast(), removeLast() and removeFirst() methods in addition to other list methods like add
  // here we will add all nodes (parents and children) in collection
  final ListQueue<int> nodeStack = ListQueue<int>();

  // 1 is the first node in this example
  final _initialNode = 1;
  late int _currentNode;

  DepthFirstIterator(this.treeCollection) {
    _currentNode = _initialNode;
    nodeStack.add(_initialNode);
  }

  // return map called (adjacencyList) from graph class that has edges
  Map<int, Set<int>> get adjacencyList => treeCollection.graph.adjacencyList;

  @override
  bool hasNext() => nodeStack.isNotEmpty;

  @override
  int? getNext() {
    if (!hasNext()) return null;

    // current node after removing last node and get next node from last (in the back of the list)
    _currentNode = nodeStack.removeLast();
    // after removing last node you will get next node from last (in the back of the list)
    // we will add it in visited node Set (it is the parent nodes)
    visitedNodes.add(_currentNode);

    // here we will add all children nodes (if it has) to nodeQueue to traverse them except parent node (visitedNode)
    // like (1, 2), (1, 3), (1, 4) so 1 is the (key) and it is the parent node and 2, 3, 4 are children and so on..
    if (adjacencyList.containsKey(_currentNode)) {
      for (final node in adjacencyList[_currentNode]!
          .where((n) => !visitedNodes.contains(n))) {
        nodeStack.addLast(node);
      }
    }

    // here we will return the next node to travers
    return _currentNode;
  }

  @override
  void reset() {
    _currentNode = _initialNode;
    visitedNodes.clear();
    nodeStack.clear();
    nodeStack.add(_initialNode);
  }
}
