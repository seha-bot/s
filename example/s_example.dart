import 'package:s/s.dart';

/// The M combinator.
/// Bird name: mockingbird.
/// Definition: M x = x x
final m = s(i)(i);

/// The B combinator.
/// Bird name: bluebird.
/// Definition: B x y z = x (y z)
final b = s(k(s))(k);

/// The C combinator.
/// Bird name: cardinal.
/// Definition: C x y z = x z y
final c = s(b(b)(s))(k(k));

/// The L combinator.
/// Bird name: lark.
/// Definition: L x y = x (y y)
final l = c(b)(m);

/// Definition: Y f = (\x. f (x x)) (\x. f (x x))
/// Calling this will result in a stack overflow
/// because dart is not a lazy language.
/// Use [z] instead.
final y = b(m)(l);

/// Definition: l1 f x = f (\y. x x y)
final l1 = c(b)((dynamic x) => (dynamic y) => (x)(x)(y));

/// Definition: Z f = (\x. f (\y. x x y)) (\x. f (\y. x x y))
final z = b(m)(l1);

void main() {
  final fib = z(
    (dynamic self) => (int x) => x < 2 ? x : self(x - 1) + self(x - 2),
  );

  for (final x in Iterable.generate(12, i)) {
    print(fib(x + 1));
  }
}
