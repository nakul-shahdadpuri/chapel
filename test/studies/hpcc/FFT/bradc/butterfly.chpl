
// BLC -- a good example of where one would like to declare multiple
// arguments of the same type/intent:
def butterfly(wk1: complex, wk2: complex, wk3: complex, 
              inout a, inout b, inout c, inout d) {
  var x0 = a + b;
  var x1 = a - b;
  var x2 = c + d;
  var x3 = c - d;

  a = x0 + x2;
  x0 -= x2;
  c = wk2 * x0;
  x0 = _complex(x1.real - x3.imag, x1.imag + x3.real);
  b = wk1 * x0;
  x0 = _complex(x1.real + x3.imag, x1.imag - x3.real);
  d = wk3 * x0;
}

config var logN = 3;
const N = 0x1 << logN;

const D = [0..N-1];

var A: [D] complex;

[i in D] A(i) = _complex(2*i, 2*i+1);

for i in D by 4 {
  butterfly(_complex(-1.0, -2.0), _complex(-3.0, -4.0), _complex(-5.0, -6.0),
            A(i), A(i+1), A(i+2), A(i+3));
}

writeln("A is: ", A);

