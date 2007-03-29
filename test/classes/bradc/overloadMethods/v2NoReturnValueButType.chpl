class C {
  def bbox(x: int): range {
    halt("bbox() not implemented for this class");
  }
}

class D : C {
  param rank: int;
  var ranges : rank*range(int, 0, false);

  def initialize() {
    for i in 1..rank do
      ranges(i) = 1..i;
  }

  def bbox(x: int) {
    return ranges(x);
  }
}

var d:C = D(4);
writeln(d.bbox(1));
writeln(d.bbox(2));
writeln(d.bbox(3));
writeln(d.bbox(4));
