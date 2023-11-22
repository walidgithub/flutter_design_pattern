import '../command_design_pattern/shape.dart';
import 'imemento.dart';

// memento is the copy of shape state
class Memento implements IMemento {
  final Shape _state;

  // this constructor will get shape state
  // to save state of shape you will need to use the named constructor that get the shape values (state)
  Memento(Shape shape) : _state = Shape.copy(shape);

  // return shape state
  @override
  Shape getState() => _state;
}
