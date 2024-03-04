// Define an interface
abstract class Shape {
  double area();
}

// Define a class that implements the Shape interface
class Circle implements Shape {
  double radius;

  Circle(this.radius);

  @override
  double area() {
    return 3.14 * radius * radius;
  }
}

// Define a class that overrides an inherited method
class Square implements Shape {
  double sideLength;

  Square(this.sideLength);

  @override
  double area() {
    return sideLength * sideLength;
  }
}

// Define a method to read data from a file and initialize objects
List<Shape> initializeFromFile(String fileName) {
  List<Shape> shapes = [];
  List<String> lines = [
    "Circle:5",
    "Square:4",
    "Circle:3"
  ]; // In real-world scenario, you would read from file

  for (var line in lines) {
    var parts = line.split(':');
    var shapeType = parts[0];
    var data = double.parse(parts[1]);

    if (shapeType == 'Circle') {
      shapes.add(Circle(data));
    } else if (shapeType == 'Square') {
      shapes.add(Square(data));
    }
  }
  return shapes;
}

// Define a method that demonstrates the use of a loop
void printAreas(List<Shape> shapes) {
  for (var shape in shapes) {
    print("Area of ${shape.runtimeType}: ${shape.area()}");
  }
}

void main() {
  List<Shape> shapes = initializeFromFile('shapes_data.txt');
  printAreas(shapes);
}
