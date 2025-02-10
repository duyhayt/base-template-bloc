import 'package:base_template_bloc/config/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  final bool showLeading;
  final Widget? title;
  final List<Widget>? actions;
  const CustomAppBar(
      {super.key, required this.title, this.showLeading = false, this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [CustomTheme.startColors, CustomTheme.endColors],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: AppBar(
        automaticallyImplyLeading: showLeading,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
