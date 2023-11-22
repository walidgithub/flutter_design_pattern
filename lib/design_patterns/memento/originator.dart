import 'command_design_pattern/shape.dart';
import 'memento/imemento.dart';
import 'memento/memento.dart';

// Originator is the only class deal with shape class
// Originator is responsible for loading initial shape state and saving shape state and getting last state
class Originator {
  Shape state;

  // constructor with initial state from shape
  Originator() : state = Shape.initial();

  // function to create memento (state of shape)
  // once you run this function you will copy the shape state
  IMemento createMemento() => Memento(state);

  // function to get memento data (state of shape) previous state
  void restore(IMemento memento) => state = memento.getState();
}
