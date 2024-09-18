// https://en.wikipedia.org/wiki/SKI_combinator_calculus
// Now dart has everything it needs to be a programming language :P

/// The S combinator.
/// Bird name: starling.
/// Definition: S x y z = x z (y z)
dynamic s(dynamic x) => (dynamic y) => (dynamic z) => x(z)(y(z));

/// The K combinator.
/// Bird name: kestrel.
/// Definition: K x y = x
dynamic k(dynamic x) => (dynamic y) => x;

/// The I combinator.
/// Bird name: idiot.
/// Definition: I x = x
A i<A>(A x) => x;
