import 'ipositioned_shape.dart';
import 'shape_factory.dart';
import 'shape_type.dart';

// here we use factory method to check if called flyweight object before so not call it again else call it for one time
class ShapeFlyweightFactory {
  final ShapeFactory shapeFactory;

  ShapeFlyweightFactory({
    required this.shapeFactory,
  });

  // we will fill this map with shape type and its position
  final Map<ShapeType, IPositionedShape> shapesMap = {};

  // return Circle or Square with its static and dynamic values
  IPositionedShape getShape(ShapeType shapeType) {
    // if shape type is not found in map will create shape and insert into map else return old one
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeFactory.createShape(shapeType);
    }

    return shapesMap[shapeType]!;
  }

  // return count of map length
  int getShapeInstancesCount() => shapesMap.length;
}
