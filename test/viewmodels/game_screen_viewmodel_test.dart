import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('GameScreenViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
