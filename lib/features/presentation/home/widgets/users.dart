import 'package:base_template_bloc/features/presentation/home/bloc/list_user_cubit.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_user_state.dart';
import 'package:base_template_bloc/injection_container.dart';
import 'package:base_template_bloc/widgets/custom/custom_loading_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListUser extends StatelessWidget {
  const ListUser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ListUserCubit>()..fetchUsers(),
      child:
          BlocBuilder<ListUserCubit, ListUserState>(builder: (context, state) {
        if (state is ListUserLoading) {
          return const Center(child: CustomLoadingAnimation());
        } else if (state is ListUserLoaded) {
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              final user = state.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
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
