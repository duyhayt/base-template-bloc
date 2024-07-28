import 'package:base_template_bloc/features/presentation/counter/counter_cubit.dart';
import 'package:base_template_bloc/features/presentation/counter/counter_view.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template counter_page}
/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
/// {@endtemplate}
class CounterPage extends StatelessWidget {
  /// {@macro counter_page}
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<CounterCubit>(),
      child: const CounterView(),
    );
  }
}
