import 'package:auto_route/auto_route.dart';
import 'package:base_template_bloc/features/presentation/blocs/home/home_bloc.dart';
import 'package:base_template_bloc/features/presentation/blocs/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
            elevation: 0,
            centerTitle: true,
            title: Text(AppLocalizations.of(context)!.title_home),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_outlined))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            if (state.status == HomeStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == HomeStatus.success) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  final post = state.posts[index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  );
                },
              );
            } else {
              return const Center(child: Text('No posts'));
            }
          })),
    );
  }
}
