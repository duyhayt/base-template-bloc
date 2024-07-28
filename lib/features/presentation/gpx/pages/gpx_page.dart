import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/features/presentation/gpx/bloc/gpx_bloc.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:base_template_bloc/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class GpxPage extends StatelessWidget {
  const GpxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => sl<GpxBloc>(),
        child: Scaffold(
          appBar: AppBar(title: const Text("Gpx Page")),
          body: BlocBuilder<GpxBloc, GpxState>(builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const Text("data");
                        })),
                Button(
                  title: "Import GPX File",
                  onPressed: () {
                    context.read<GpxBloc>().add(const ImportFile());
                  },
                )
              ],
            );
          }),
        ));
  }
}
