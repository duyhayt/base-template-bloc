import 'package:base_template_bloc/features/presentation/counter/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterView', () {
    // testWidgets('renders current state', (WidgetTester tester) async {
    //   await tester.pumpWidget(
    //     BlocProvider<CounterCubit>(
    //       create: (_) => sl<CounterCubit>(),
    //       child: const CounterView(),
    //     ),
    //   );
    //   expect(find.text('0'), findsOneWidget);
    // });

    blocTest<CounterCubit, int>(
      'emits [1] when increment button is pressed',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => const <int>[1],
    );

    blocTest<CounterCubit, int>(
      'emits [-1] when decrement button is pressed',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () => const <int>[-1],
    );
  });
}