import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_testing/main.dart';
import 'package:bloc_testing/my_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

class MockMyCubit extends MockCubit<int> implements MyCubit {}

void main() {
  late final MyCubit myCubit;

  setUpAll(() {
    myCubit = MockMyCubit();
  });

  group('Testing', () {
    testWidgets('counter equal to 1', (WidgetTester tester) async {
      whenListen(
        myCubit,
        Stream.fromIterable([0, 1]),
        initialState: 0,
      );

      await tester.pumpWidget(MyAppParent(myCubit: myCubit));

      // The next three lines allows to test the button exists,
      // it can be omitted and this test will still working
      Finder finderIncrement = find.text('Increment');
      expect(finderIncrement, findsOneWidget);
      await tester.tap(finderIncrement);

      await tester.pump();
      Finder finderCount = find.text('1');
      expect(finderCount, findsOneWidget);
    });
  });

  group(
    'Testing',
    () {
      testWidgets(
          'counter equal to 0 after incrementing and decrementing, in that order',
          (WidgetTester tester) async {
        whenListen(
          myCubit,
          Stream.fromIterable([0, 1, 0]),
          initialState: 0,
        );

        await tester.pumpWidget(MyAppParent(myCubit: myCubit));

        // The next three lines allows to test the button exists,
        // it can be omitted and this test will still working
        Finder finderDecrement = find.text('Decrement');
        expect(finderDecrement, findsOneWidget);
        await tester.tap(finderDecrement);

        await tester.pump();
        Finder finderCount = find.text('0');
        expect(finderCount, findsOneWidget);
      });
    },
  );
}
