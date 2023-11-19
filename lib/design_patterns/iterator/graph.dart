class Graph {
  final Map<int, Set<int>> adjacencyList = {};

  // edges from vertex to other (you may have many edge for every vertex)
  void addEdge(int source, int target) {
    adjacencyList.containsKey(source)
    // update target value for source key in map
        ? adjacencyList[source]!.add(target)
    // add new key (source) and its value (target) to map
        : adjacencyList[source] = {target};
  }
}
