import 'package:base_template_bloc/features/presentation/home/bloc/list_post_cubit.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_post_state.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPost extends StatelessWidget {
  const ListPost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ListPostCubit>()..fetchPosts(),
      child:
          BlocBuilder<ListPostCubit, ListPostState>(builder: (context, state) {
        if (state is ListPostLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ListPostLoaded) {
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
      }),
    );
  }
}
